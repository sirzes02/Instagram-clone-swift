//
//  AuthManager.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 30/09/24.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()

    // MARK: - Public

    public func registerNewUser(with username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }

                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        completion(inserted)
                    }
                }
            } else {
                completion(false)
            }
        }
    }

    public func loginUser(with username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }

                completion(true)
            }
        } else if let username = username {
            print(username)
        }
    }

    public func logOut(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}
