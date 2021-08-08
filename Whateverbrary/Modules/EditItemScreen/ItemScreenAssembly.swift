//
//  ItemScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class ItemScreenAssembly {
    func build(navigator: Navigator, item: ItemViewModel?, state: ItemScreenStates) -> UIViewController {
//        let userDefaultStorage = AppDelegate.container.resolve(IUserDefaultsStorage.self)!
        let router = ItemScreenRouter(navigator: navigator)
        let presenter = ItemScreenPresenter(router: router)
        let controller = ItemScreenViewController(presenter: presenter)
        return controller
    }

}
