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
    let userService: UserServiceProtocol
    var cancellables: [AnyCancellable] = []
    ///™«««««««««««««««««««««««««««««««««««
    
    // MARK: -∆  Computed-Property  '''''''''''''''''''''
        
    // MARK: -∆ Initializer
    ///∆.................................
    init(userService: UserServiceProtocol = UserService()) {
        //∆..........
        self.userService = userService
    }
    ///∆.................................
}
// MARK: END OF: CreateChallengeViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

// MARK: -∆  EXTENSION OF: [( CreateChallengeViewModel )] •••••••••
/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

extension CreateChallengeViewModel {
    
    // MARK: @------- [Child-Struct] -------
    /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
    
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
    }
    // MARK: END OF: ChallengePartViewModel
    
    /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

}
// MARK: END OF: CreateChallengeViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••


