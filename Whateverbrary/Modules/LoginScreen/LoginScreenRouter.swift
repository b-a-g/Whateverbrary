//
//  LoginScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit

class LoginScreenRouter: ILoginScreenRouter {

//    weak var controller: UIViewController?

    func openUserScreen(user: UserModel) {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        let viewController = UserScreenAssembly().build()
        let navigationVC = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationVC
        window.makeKeyAndVisible()
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
    }
}
