//
//  DatabaseManager.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 30/09/24.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()

    private let database = Database.database().reference()

    // MARK: - Public

    public func canCreateNewUser(with _: String, username _: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }

    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            completion(error == nil)
        }
    }
}
