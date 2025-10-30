//
//  User.swift
//  SmartFit
//
//  Created by Edwin Yu
//

import Foundation

struct User: Codable {
    let email: String
    let name: String?
    let idToken: String

    init(email: String, name: String?, idToken: String) {
        self.email = email
        self.name = name
        self.idToken = idToken
    }
}
