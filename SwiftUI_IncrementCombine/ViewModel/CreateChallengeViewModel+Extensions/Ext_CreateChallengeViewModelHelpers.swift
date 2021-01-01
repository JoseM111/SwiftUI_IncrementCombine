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
        case .createChallenge:
            currentUserId().flatMap { userId -> AnyPublisher<Void, Error> in
                //∆..........
                return self.createChallenge(userId: userId)
            }
            .sink { completion in
                //∆..........
                switch completion {
                //∆..........
                case let .failure(error): print("DEBUG: \(error.localizedDescription)")
                case .finished: print("DEBUG: Completed successfully")
                //∆..........
                }
                //∆..........
            } receiveValue: { _ in
                //∆..........
                print("DEBUG: Success creating challenge!..")
                //∆..........
            }.store(in: &cancellables)
        }
        // ∆ END OF: switch
    }
    /// ∆ END OF: send ---
    
    /// ™ createChallenge ----------
    func createChallenge(userId: UserId) -> AnyPublisher<Void, Error> {
        //∆..........
        guard let exercise = exerciseDropdown.text,
        let startAmount = startAmountDropdown.number,
        let increase = increaseDropdown.number,
        let length = lengthDropdown.number
        else { return Fail(error: NSError()).eraseToAnyPublisher() }

        let challenge: ChallengeModel = .init(
            exercise: exercise, startAmount: startAmount,
            increase: increase, length: length,
            userId: userId, startDate: Date())
        
        return challengeService.create(challenge: challenge).eraseToAnyPublisher()
    }
    /// ∆ END OF: createChallenge ---
    
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
