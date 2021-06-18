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
//completion handler closure
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                    case .operationNotAllowed:
                        print("Error: \(error.localizedDescription)")
                    case .emailAlreadyInUse:
                        print("Error: \(error.localizedDescription)")
                    case .invalidEmail:
                        print("Error: \(error.localizedDescription)")
                    case .weakPassword:
                        print("Error: \(error.localizedDescription)")
                    default:
                        print("Error: \(error.localizedDescription)")
                }
            } else {
                print("User signs up successfully")
                let newUserInfo = Auth.auth().currentUser
                let email = newUserInfo?.email
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
          if let error = error as NSError? {
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed:
                print("Error: \(error.localizedDescription)")
              // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
            case .userDisabled:
                print("Error: \(error.localizedDescription)")
              // Error: The user account has been disabled by an administrator.
            case .wrongPassword:
                print("Error: \(error.localizedDescription)")
              // Error: The password is invalid or the user does not have a password.
            case .invalidEmail:
                print("Error: \(error.localizedDescription)")
              // Error: Indicates the email address is malformed.
            default:
                print("Error: \(error.localizedDescription)")
            }
          } else {
            print("User signs in successfully")
            let userInfo = Auth.auth().currentUser
            let email = userInfo?.email
          }
        }
    }
}
