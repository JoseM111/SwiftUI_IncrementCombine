import SwiftUI

// MARK: -∆  EXTENSION OF: [( ChallengePartViewModel )] •••••••••

typealias CreateChallengeExerciseOptions = CreateChallengeViewModel
//∆.....................................................

extension CreateChallengeExerciseOptions.ChallengePartViewModel {
    
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

// MARK: -∆  EXTENSION OF: [( ChallengePartViewModel )] •••••••••

extension CreateChallengeExerciseOptions.ChallengePartViewModel {
    
    /// ™ text ----------
    var text: String? {
        //∆..........
        if case let .text(text) = selectedOption.type {
            return text
        }
        
        return nil
    }
    /// ∆ END OF: text ----
    
    /// ™ number ----------
    var number: Int? {
        //∆..........
        if case let .number(number) = selectedOption.type {
            return number
        }
        
        return nil
    }
    /// ∆ END OF: number ----
}
// MARK: END OF: ChallengePartViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
