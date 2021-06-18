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

    typealias completionHandler = (_ user: User?, _ error: Error?) -> Void
    func signUp(email: String, password: String, completionHandler: @escaping completionHandler) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                    case .operationNotAllowed:
                        print("Error: \(error.localizedDescription)")
                        completionHandler(nil, error)
                    case .emailAlreadyInUse:
                        print("Error: \(error.localizedDescription)")
                        completionHandler(nil, error)
                    case .invalidEmail:
                        print("Error: \(error.localizedDescription)")
                        completionHandler(nil, error)
                    case .weakPassword:
                        print("Error: \(error.localizedDescription)")
                        completionHandler(nil, error)
                    default:
                        print("Error: \(error.localizedDescription)")
                        completionHandler(nil, error)
                }
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
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed:
                print("Error: \(error.localizedDescription)")
                completionHandler(nil, error)
            case .userDisabled:
                print("Error: \(error.localizedDescription)")
                completionHandler(nil, error)
            case .wrongPassword:
                print("Error: \(error.localizedDescription)")
                completionHandler(nil, error)
            case .invalidEmail:
                print("Error: \(error.localizedDescription)")
                completionHandler(nil, error)
            default:
                print("Error: \(error.localizedDescription)")
                completionHandler(nil, error)
            }
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
