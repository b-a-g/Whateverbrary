//
//  InterfaceConstants.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit

struct InterfaceConstants {
    static let defaultSpacing: CGFloat = 12
    static let defaultBackgroundColor: UIColor = .secondarySystemBackground

    //Login screen constants
    static let emailInputFieldPlaceholder = "Почта"
    static let passwordInputfieldPlaceholder = "Пароль"
    static let signInButtonTitle = "Войти"
    static let signUpButtonTitle = "Регистрация"

    //User screen constants
    static let signOutButtonTitle = "Выйти"
    static let collectionButtonTitle = "ЧтоУгодноТека"
    static let friendsButtonTitle = "Друзья"
    static let borrowedButtonTitle = "Не моё"
    static let owedButtonTitle = "Не у меня"
    static let notificationsButtonTitle = "Уведомления"
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
