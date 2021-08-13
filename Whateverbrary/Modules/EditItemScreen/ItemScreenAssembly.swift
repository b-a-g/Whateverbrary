//
//  ItemScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class ItemScreenAssembly {
    func build(navigator: Navigator, user: UserModel, item: ItemViewModel?, state: ItemScreenStates) -> UIViewController {
//        let userDefaultStorage = AppDelegate.container.resolve(IUserDefaultsStorage.self)!
        let router = ItemScreenRouter(navigator: navigator, user: user)
        let presenter = ItemScreenPresenter(router: router, user: user, item: item)
        let controller = ItemScreenViewController(presenter: presenter)
        return controller
    }

}
