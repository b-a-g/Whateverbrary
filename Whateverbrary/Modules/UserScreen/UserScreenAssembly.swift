//
//  UserScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit

class UserScreenAssembly {
    func build(navigator: Navigator, user: UserModel) -> UIViewController {
        let router = UserScreenRouter(navigator: navigator, user: user)
        let presenter = UserScreenPresenter(router: router, user: user)
        let controller = UserScreenViewController(presenter: presenter)
        return controller
    }
}
