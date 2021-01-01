import SwiftUI
import Combine
import FirebaseAuth

protocol UserServiceProtocol {
    // MARK: - ™Implemention For conforming Object™
    ///™«««««««««««««««««««««««««««««««««««
    // ™ Combine with Firebase functions
    func currentUser() -> AnyPublisher<User?, Never>
    func signInAnonymously() -> AnyPublisher<User, IncrementError>
    ///™«««««««««««««««««««««««««««««««««««
}
// MARK: END OF PROTOCOL: UserServiceProtocol

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

final class UserService: UserServiceProtocol {
    
    /// ™ Conforming to protocol ----------
    ///
    /// ™ `AnyPublisher<Type1, Type2>` expose simplified types
    func currentUser() -> AnyPublisher<User?, Never> {
        ///∆ ...........
        /// |™-`eraseToAnyPublisher()`: Adapting publisher type
        /// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
        ///   • When chaining operators together, the resulting type signature accumulates
        ///     all the various types. This can get complicated quite quickly, and can provide
        ///     an unnecessarily complex signature for an API. eraseToAnyPublisher takes the
        ///     signature and "erases" the type back to the common type of AnyPublisher. This
        ///     provides a cleaner type for external declarations. Combine was created prior to
        ///     Swift 5 inclusion of opaque types, which may have been an alternative.
        ///
        ///   • `eraseToAnyPublisher`: is often at the end of chains of operators,
        ///     cleaning up the signature of the returned property.
        ///  ............
        Just(Auth.auth().currentUser).eraseToAnyPublisher()
    }
    
    func signInAnonymously() -> AnyPublisher<User, IncrementError> {
        //∆..........Future: Like a promise is a single uses publisher
        Future<User, IncrementError> { promise in
            //∆..........
            Auth.auth().signInAnonymously { result, error in
                //∆..........
                if let error = error {
                    //∆..........
                    return promise(.failure(.auth(description: error.localizedDescription)))
                    //∆..........
                } else if let user = result?.user {
                    //∆..........
                    return promise(.success(user))
                }
                // ∆ END OF: if-let
            }
            // ∆ END OF: Auth.auth().signInAnonymously
        }.eraseToAnyPublisher()
        // ∆ END OF: Future
    }
    /// ™ Conforming to protocol ----------
    
}
// MARK: END OF: UserService

