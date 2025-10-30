//
//  AuthenticationController.swift
//  SmartFit
//
//  Created by Edwin Yu
//

import Foundation
import UIKit

protocol AuthenticationDelegate: AnyObject {
    func didSignIn(user: User)
    func didSignOut()
    func didFailWithError(_ error: Error)
}

class AuthenticationController {

    weak var delegate: AuthenticationDelegate?

    private let userDefaultsKey = "currentUser"
    private(set) var currentUser: User?

    init() {
        loadUserFromStorage()
    }

    // MARK: - Authentication Methods

    func signInWithGoogle(idToken: String, email: String, name: String?) {
        let user = User(email: email, name: name, idToken: idToken)
        self.currentUser = user
        saveUserToStorage(user)
        delegate?.didSignIn(user: user)
    }

    func signOut() {
        currentUser = nil
        clearUserFromStorage()
        delegate?.didSignOut()
    }

    func isAuthenticated() -> Bool {
        return currentUser != nil
    }

    // MARK: - Persistence

    private func saveUserToStorage(_ user: User) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    private func loadUserFromStorage() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let user = try? JSONDecoder().decode(User.self, from: data) {
            self.currentUser = user
        }
    }

    private func clearUserFromStorage() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
