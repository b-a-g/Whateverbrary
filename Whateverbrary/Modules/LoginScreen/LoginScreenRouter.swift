//
//  LoginScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit

class LoginScreenRouter: ILoginScreenRouter {

    weak var controller: UIViewController?

    func openUserScreen(user: UserModel) {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.makeKeyAndVisible()
    }
}
