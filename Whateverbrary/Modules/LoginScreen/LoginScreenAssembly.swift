//
//  LoginScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit

class LoginScreenAssembly {
    func build(navigator: Navigator) -> UIViewController {
        let userDefaultsStorage = AppDelegate.container.resolve(IUserDefaultsStorage.self)!
        let router = LoginScreenRouter(navigator: navigator)
        let presenter = LoginScreenPresenter(userDefaultsStorage: userDefaultsStorage, router: router)
        let controller = LoginScreenViewController(presenter: presenter)
        return controller
    }
}
