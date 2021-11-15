//
//  Localization.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.11.2021.
//

import Foundation
import Firebase

public class LocalizationService {

    public static func localize(for error: Error) -> String {
        var resultError = ""
        if let error = error as NSError? {
            print("Error: \(error.localizedDescription)")
            switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    resultError = NSLocalizedString("AUTH_ERROR_OPERATION_NOT_ALLOWED", comment: "")
                case .tooManyRequests:
                    resultError = NSLocalizedString("AUTH_ERROR_TOO_MANY_REQUESTS", comment: "")
                case .emailAlreadyInUse:
                    resultError = NSLocalizedString("AUTH_ERROR_EMAILALREADY_IN_USE", comment: "")
                case .invalidEmail:
                    resultError = NSLocalizedString("AUTH_ERROR_INVALID_EMAIL", comment: "")
                case .weakPassword:
                    resultError = NSLocalizedString("AUTH_ERROR_WEAK_PASSWORD", comment: "")
                case .userDisabled:
                    resultError = NSLocalizedString("AUTH_ERROR_USER_DISABLED", comment: "")
                case .userNotFound:
                    resultError = NSLocalizedString("AUTH_ERROR_USER_NOT_FOUND", comment: "")
                case .wrongPassword:
                    resultError = NSLocalizedString("AUTH_ERROR_WRONG_PASSWORD", comment: "")
                default:
                    resultError = NSLocalizedString("AUTH_ERROR_DEFAULT", comment: "")
            }
        }
        return resultError
    }

    public static func localize(for string: String) -> String {
        return NSLocalizedString(string, comment: "")
    }
}
