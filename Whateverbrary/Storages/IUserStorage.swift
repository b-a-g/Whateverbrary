//
//  IUserStorage.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 21.06.2021.
//

import Foundation

protocol IUserStorage {
    func getUser() -> UserModel?
    func saveUser(user: UserModel, completion: @escaping () -> Void)
}
