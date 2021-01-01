import SwiftUI
import Combine
import FirebaseAuth

//∆.....................................................
typealias UserId = String
//∆.....................................................

final class CreateChallengeViewModel: ObservableObject {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    @Published var dropdowns: [ChallengePartViewModel] = [
        //∆..........
        .init(type: .exercise),
        .init(type: .startAmount),
        .init(type: .increase),
        .init(type: .length)
        //∆..........
    ]
    
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    ///™«««««««««««««««««««««««««««««««««««
    
    // MARK: -∆  Computed-Property  '''''''''''''''''''''
    
    /// ™ selectedDropdown ----------
    var selectedDropdown: Bool {
        //∆..........
        selectedDropdownIndex != nil
    }
    // ∆ END OF: selectedDropdown
    
    /// ™ selectedDropdownIndex ----------
    var selectedDropdownIndex: Int? {
        //∆..........
        dropdowns.enumerated().first(where: { $0.element.isSelected })?.offset
    }
    /// ∆ END OF: selectedDropdownIndex
    
    /// ™ displayOption ----------
    var displayOption: [DropdownOption] {
        //∆..........
        guard let selected = selectedDropdownIndex else { return [] }
        return dropdowns[selected].options
    }
    /// ∆ END OF: displayOption
    
    /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
    
    /// ™ Action ----------
    enum Action {
        // MARK: - ™CASES™
        ///™«««««««««««««««««««««««««««««««««««
        case selectOption(index: Int)
        case createChallenge
        ///™«««««««««««««««««««««««««««««««««««
    }
    // MARK: END OF ENUM: Action
    
    /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
    
    // MARK: -∆ Initializer
    ///∆.................................
    init(userService: UserServiceProtocol = UserService()) {
        //∆..........
        self.userService = userService
    }
    ///∆.................................
    
    ///∆ ........... Helper Methods ...........
    
    /// ™ send ----------
    func send(action: Action) -> Void {
        //∆..........
        switch action {
        //∆..........
        case .selectOption(index: let index):
            //∆..........
            guard let selected = selectedDropdownIndex else { return }
            // Sets back to false: Clears th selected option
            clearSelectedOption()
            
            dropdowns[selected].options[index].isSelected = true
            // Sets back to false: Clears the drop down
            clearSelectedDropdown()
        //∆..........
        case .createChallenge: currentUserId().sink { completion in
            //∆..........
            switch completion {
            //∆..........
            case .finished: print("Completed successfully")
            //∆..........
            case let .failure(error): print("DEBUG: \(error.localizedDescription)")
            //∆..........
            }
            //∆..........
            
        } receiveValue: { userId in
            //∆..........
            print("DEBUG: Retrived user id: \(userId)")
            //∆..........
        }.store(in: &cancellables)
        
        }
        // ∆ END OF: switch
    }
    /// ∆ END OF: send ---
    
    /// ™ clearSelectedOptions ----------
    func clearSelectedOption() -> Void {
        //∆..........
        guard let selected = selectedDropdownIndex else { return }
        dropdowns[selected].options.indices.forEach { index in
            //∆..........
            dropdowns[selected].options[index].isSelected = false
        }
        // ∆ END OF: end of closure.
    }
    /// ∆ END OF: clearSelectedOptions ---
    
    /// ™ clearSelectedDropdown ----------
    func clearSelectedDropdown() -> Void {
        //∆..........
        guard let selected = selectedDropdownIndex else { return }
        //∆..........
        dropdowns[selected].isSelected = false
    }
    /// ∆ END OF: clearSelectedDropdown ---
    
    /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
    
    /// ™ currentId(Combine) ----------
    func currentUserId() -> AnyPublisher<UserId, Error> {
        //∆..........
        print("DEBUG: Retrieving user ID...")
        
        return userService.currentUser()
            .flatMap { user -> AnyPublisher<UserId, Error> in
                //∆..........
                if let userId = user?.uid {
                    //∆..........
                    print("DEBUG: User is logged in...")
                    
                    return Just(userId)
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                } else {
                    //∆..........
                    print("DEBUG: User is being logged in anonymously...")

                    return self.userService
                        .signInAnonymously().map { $0.uid }
                        .eraseToAnyPublisher()
                }
                // ∆ END OF: if-let
            }.eraseToAnyPublisher()
    }
    /// ∆ END OF: currentId ---
    
}
// MARK: END OF: CreateChallengeViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

// MARK: -∆  EXTENSION OF: [( CreateChallengeViewModel )] •••••••••

extension CreateChallengeViewModel {
    
    // MARK: @------- [Child-Struct] -------
    
    struct ChallengePartViewModel: DropdownItemProtocol {
        
        // MARK: - ™PROTOCOL-PROPERTIES™
        ///™«««««««««««««««««««««««««««««««««««
        var options: [DropdownOption]
        var isSelected: Bool = false
        private var type: ChallengePartType
        ///™«««««««««««««««««««««««««««««««««««
        
        // MARK: -∆  Computed-Property  '''''''''''''''''''''
        
        /// ™ headerTitle ----------
        var headerTitle: String {
            //∆..........
            /// The header title will be driven by the enums raw values
            type.rawValue
        }
        /// ∆ END OF: headerTitle
        
        /// ™ dropdownTitle ----------
        var dropdownTitle: String {
            //∆..........
            /// Looks through the selected options & displays
            /// the formmated value of the option selected
            options.first(where: { $0.isSelected })?.formatted ?? ""
        }
        /// ∆ END OF: dropdownTitle
        
        /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
        
        // MARK: -∆ Initializer Injecting our ChallengePartType
        ///∆.................................
        init(type: ChallengePartType) {
            //∆..........
            switch type {
            //∆..........
            case .exercise: self.options = ExcerciseOption.allCases.map { $0.toDropdownOption }
            //∆..........
            case .startAmount: self.options = StartAmount.allCases.map { $0.toDropdownOption }
            //∆..........
            case .increase: self.options = IncreaseAmount.allCases.map { $0.toDropdownOption }
            //∆..........
            case .length: self.options = LengthAmount.allCases.map { $0.toDropdownOption }
            //∆..........
            }
            
            self.type = type
        }
        ///∆.................................
        
        /// ™ ChallengePartType ----------
        enum ChallengePartType: String, CaseIterable {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case exercise = "Exercise"
            case startAmount = "Starting Amount"
            case increase = "Daily Increase"
            case length = "Challenge Length"
            ///™«««««««««««««««««««««««««««««««««««
        }
        // MARK: END OF ENUM: ChallengePartType
        
        /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
        
        /// ™ ExcerciseOption ----------
        enum ExcerciseOption: String, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case pullups
            case pushups
            case situps
            ///™«««««««««««««««««««««««««««««««««««
            
            /// ™ toDropdownOption ----------
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .text(rawValue),
                      formatted: rawValue.capitalized,
                      isSelected: self == .pullups)
            }
            /// ∆ END OF: toDropdownOption ----
        }
        // MARK: END OF ENUM: ExcerciseOption
        
        /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
        
        /// ™ StartAmount ----------
        enum StartAmount: Int, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case one = 1, two, three, four, five
            ///™«««««««««««««««««««««««««««««««««««
            
            /// ™ toDropdownOption ----------
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .number(rawValue),
                      formatted: "\(rawValue)",
                      isSelected: self == .one)
            }
            /// ∆ END OF: toDropdownOption ----
        }
        // MARK: END OF ENUM: StartAmount
        
        /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
        
        /// ™ IncreaseAmount ----------
        enum IncreaseAmount: Int, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case one = 1, two, three, four, five
            ///™«««««««««««««««««««««««««««««««««««
            
            
            /// ™ toDropdownOption ----------
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .number(rawValue),
                      formatted: "+\(rawValue)",
                      isSelected: self == .one)
            }
            /// ∆ END OF: toDropdownOption ----
        }
        // MARK: END OF ENUM: IncreaseAmount
        
        /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
        
        /// ™ LengthAmount ----------
        enum LengthAmount: Int, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            ///™«««««««««««««««««««««««««««««««««««
            
            /// ™ toDropdownOption ----------
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .number(rawValue),
                      formatted: "\(rawValue) days",
                      isSelected: self == .seven)
            }
            /// ∆ END OF: toDropdownOption ----
        }
        // MARK: END OF ENUM: LengthAmount
        
        /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
    }
    // MARK: END OF: ChallengePartViewModel
}
// MARK: END OF: CreateChallengeViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

