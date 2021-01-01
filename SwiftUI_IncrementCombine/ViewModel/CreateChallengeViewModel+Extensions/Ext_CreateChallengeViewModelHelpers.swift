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
            //∆..........
            isLoading = true
            //∆..........
            currentUserId().flatMap { userId -> AnyPublisher<Void, IncrementError> in
                //∆..........
                return self.createChallenge(userId: userId)
            }
            .sink { completion in
                //∆..........
                self.isLoading = false
                //∆..........
                switch completion {
                //∆..........
                case let .failure(error): self.error = error
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
    func createChallenge(userId: UserId) -> AnyPublisher<Void, IncrementError> {
        //∆..........
        guard let exercise = exerciseDropdown.text,
              let startAmount = startAmountDropdown.number,
              let increase = increaseDropdown.number,
              let length = lengthDropdown.number
        else {
            return Fail(error: .default(description: "DEBUG: Parsing error..."))
                .eraseToAnyPublisher()
        }

        let challenge: ChallengeModel = .init(
            exercise: exercise, startAmount: startAmount,
            increase: increase, length: length,
            userId: userId, startDate: Date())
        
        return challengeService.create(challenge: challenge).eraseToAnyPublisher()
    }
    /// ∆ END OF: createChallenge ---
    
    /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
    
    /// ™ currentId(Combine) ----------
    func currentUserId() -> AnyPublisher<UserId, IncrementError> {
        //∆..........
        /// ™ Testing the custom alert error
//        let customErrorCombineAnyPublisher: AnyPublisher<UserId, IncrementError> =
//            Fail(error: .auth(description: "FirebaseAuth error..."))
//            .eraseToAnyPublisher()
            
        print("DEBUG: Retrieving user ID...")
        
        return userService.currentUser()
            .flatMap { user -> AnyPublisher<UserId, IncrementError> in
                ///∆..........Error Alert test
//                return customErrorCombineAnyPublisher
                
                if let userId = user?.uid {
                    //∆..........
                    print("DEBUG: User is logged in...")

                    return Just(userId)
                        .setFailureType(to: IncrementError.self)
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
