import SwiftUI

// MARK: -∆  EXTENSION OF: [( ChallengePartViewModel )] •••••••••

typealias CreateChallengeExerciseOptionsEnums = CreateChallengeViewModel
// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
extension CreateChallengeExerciseOptionsEnums {
    
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
    
    
}
// MARK: END OF: ChallengePartViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
