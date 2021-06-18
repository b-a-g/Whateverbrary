//
//  UserModel.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

struct UserModel {
    let id: UUID
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.id = UUID()
        self.email = email
        self.password = password
    }
}
