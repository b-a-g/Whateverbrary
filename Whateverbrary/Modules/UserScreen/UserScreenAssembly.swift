//
//  UserScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit

class UserScreenAssembly {
    func build(navigator: Navigator) -> UIViewController {
        let userDefaultsStorage = AppDelegate.container.resolve(IUserDefaultsStorage.self)!
        let router = UserScreenRouter(navigator: navigator)
        let presenter = UserScreenPresenter(userDefaultStorage: userDefaultsStorage, router: router)
        let controller = UserScreenViewController(presenter: presenter)
        return controller
    }
}
