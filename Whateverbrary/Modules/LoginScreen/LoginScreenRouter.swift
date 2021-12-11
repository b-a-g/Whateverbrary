//
//  LoginScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit

class LoginScreenRouter: ILoginScreenRouter {

    let navigator: Navigator
    init(navigator: Navigator) {
        self.navigator = navigator
    }

    func openUserScreen(user: UserModel) {
        navigator.openUserScreen(user: user)
    }
}
