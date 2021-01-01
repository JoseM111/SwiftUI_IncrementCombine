import SwiftUI
import Combine
import FirebaseAuth

//∆.....................................................
typealias UserId = String
//∆.....................................................

final class CreateChallengeViewModel: ObservableObject {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    @Published var exerciseDropdown: ChallengePartViewModel = .init(type: .exercise)
    @Published var startAmountDropdown: ChallengePartViewModel = .init(type: .startAmount)
    @Published var increaseDropdown: ChallengePartViewModel = .init(type: .increase)
    @Published var lengthDropdown: ChallengePartViewModel = .init(type: .length)
    //™•••••••••••••••••••••••••••••••••••«
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    ///™«««««««««««««««««««««««««««««««««««
    
    // MARK: -∆  Computed-Property  '''''''''''''''''''''
        
    /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
    
    /// ™ Action ----------
    enum Action {
        // MARK: - ™CASES™
        ///™«««««««««««««««««««««««««««««««««««
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
        var selectedOption: DropdownOption
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
            selectedOption.formatted
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
            self.selectedOption = options.first!
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
                      formatted: rawValue.capitalized)
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
                      formatted: "\(rawValue)")
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
                      formatted: "+\(rawValue)")
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
                      formatted: "\(rawValue) days")
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

