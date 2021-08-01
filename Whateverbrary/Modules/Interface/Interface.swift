//
//  InterfaceConstants.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit

struct InterfaceConstants {
    static let defaultSpacing: CGFloat = 12
    static let defaultBigCornerRadius: CGFloat = 25
    static let defaultSmallCornerRadius: CGFloat = 10
    static let defaultBackgroundColor: UIColor = .lightGray.withAlphaComponent(0.2)
    static let blueBackgroundColor: UIColor = .systemBlue.withAlphaComponent(0.3)

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

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
