//
//  AuthService.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import Foundation
import Firebase

class AuthService {
    static let authService = AuthService()

    typealias completionHandler = (_ user: User?, _ error: String?) -> Void
    func signUp(email: String, password: String, completionHandler: @escaping completionHandler) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as NSError? {
                completionHandler(nil, Localization.localize(for: error))
            } else {
                print("User signs up successfully")
                let newUserInfo = Auth.auth().currentUser
                completionHandler(newUserInfo, nil)
            }
        }
    }

    func signIn(email: String, password: String, completionHandler: @escaping completionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error as NSError? {
                completionHandler(nil, Localization.localize(for: error))
            } else {
                print("User signs in successfully")
                let userInfo = Auth.auth().currentUser
                completionHandler(userInfo, nil)
            }
        }
    }

    func signOut() {
        do {
          try Auth.auth().signOut()
        } catch {
          print("Sign out error")
        }
    }
}
