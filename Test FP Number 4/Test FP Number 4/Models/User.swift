//
//  User.swift
//  Test FP number 3
//
//  Created by Ваня Науменко on 29.05.22.
//

import Foundation
import Firebase

struct User {
    let uidi: String
    let email: String
    
    init(user: Firebase.User) {
        self.uidi = user.uid
        self.email = user.email ?? ""
    }
}
