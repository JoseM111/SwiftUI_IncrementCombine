import SwiftUI

import SwiftUI

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
    ///™«««««««««««««««««««««««««««««««««««
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
        var headerTitle: String {
            //∆..........
            /// The header title will be driven by the enums raw values
            type.rawValue
        }
        
        var dropdownTitle: String {
            //∆..........
            /// Looks through the selected options & displays
            /// the formmated value of the option selected
            options.first(where: { $0.isSelected })?.formatted ?? ""
        }
        
        var isSelected: Bool = false
        private var type: ChallengePartType
        ///™«««««««««««««««««««««««««««««««««««
        
        // MARK: -∆ Initializer Injecting our ChallengePartType
        ///∆.................................
        init(type: ChallengePartType) {
            //∆..........
            switch type {
                //∆..........
            case .exercise:
                self.options = ExcerciseOption.allCases.map { $0.toDropdownOption }
                //∆..........
            case .startAmount:
                self.options = StartAmount.allCases.map { $0.toDropdownOption }
                //∆..........
            case .increase:
                self.options = IncreaseAmount.allCases.map { $0.toDropdownOption }
                //∆..........
            case .length:
                self.options = LengthAmount.allCases.map { $0.toDropdownOption }
                //∆..........
            }
            
            self.type = type
        }
        ///∆.................................
        //∆.....................................................
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
        //∆.....................................................
        
        enum ExcerciseOption: String, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case pullups
            case pushups
            case situps
            ///™«««««««««««««««««««««««««««««««««««
            
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .text(rawValue),
                      formatted: rawValue.capitalized,
                      isSelected: self == .pullups)
            }
            // ∆ END OF: toDropdownOption
        }
        // MARK: END OF ENUM: ExcerciseOption
        //∆.....................................................
        
        enum StartAmount: Int, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case one = 1, two, three, four, five
            ///™«««««««««««««««««««««««««««««««««««
            
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .number(rawValue),
                      formatted: "\(rawValue)",
                      isSelected: self == .one)
            }
            // ∆ END OF: toDropdownOption
        }
        // MARK: END OF ENUM: StartAmount
        //∆.....................................................
        
        enum IncreaseAmount: Int, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case one = 1, two, three, four, five
            ///™«««««««««««««««««««««««««««««««««««
            
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .number(rawValue),
                      formatted: "+\(rawValue)",
                      isSelected: self == .one)
            }
            // ∆ END OF: toDropdownOption
        }
        // MARK: END OF ENUM: IncreaseAmount
        //∆.....................................................
        
        enum LengthAmount: Int, CaseIterable, DropdownOptionProtocol {
            // MARK: - ™CASES™
            ///™«««««««««««««««««««««««««««««««««««
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            ///™«««««««««««««««««««««««««««««««««««
            
            var toDropdownOption: DropdownOption {
                //∆..........
                .init(type: .number(rawValue),
                      formatted: "\(rawValue) days",
                      isSelected: self == .seven)
            }
            // ∆ END OF: toDropdownOption
        }
        // MARK: END OF ENUM: LengthAmount
        //∆.....................................................
    }
    // MARK: END OF: ChallengePartViewModel
}
// MARK: END OF: CreateChallengeViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

