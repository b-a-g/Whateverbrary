//
//  UserModel.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

public class UserModel: NSObject {
    let uid: UUID
    let email: String

    init(email: String) {
        self.uid = UUID()
        self.email = email
    }

    init?(user: AppUser) {
        guard let uid = user.uid,
              let email = user.email
        else { return nil }
        self.uid = uid
        self.email = email
    }
}
