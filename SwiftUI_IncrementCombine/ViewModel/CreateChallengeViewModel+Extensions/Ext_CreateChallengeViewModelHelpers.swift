import SwiftUI
import Combine

// MARK: -∆  EXTENSION OF: [( CreateChallengeViewModel )] •••••••••

typealias CreateChallengeViewModelHelpers = CreateChallengeViewModel
//∆.....................................................
extension CreateChallengeViewModelHelpers {
    
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
    
    
    // MARK: @------- [Class Methods] -------
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
// MARK: END OF EXTENSION: CreateChallengeViewModel

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
