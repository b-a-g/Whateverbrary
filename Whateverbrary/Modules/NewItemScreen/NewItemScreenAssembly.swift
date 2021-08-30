//
//  NewItemScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class NewItemScreenAssembly {
    func build(navigator: Navigator, user: UserModel, item: ItemViewModel?, state: NewItemScreenStates) -> UIViewController {
//        let userDefaultStorage = AppDelegate.container.resolve(IUserDefaultsStorage.self)!
        let router = NewItemScreenRouter(navigator: navigator, user: user)
        let presenter = NewItemScreenPresenter(router: router, user: user, item: item)
        let controller = NewItemScreenViewController(presenter: presenter, state: state, item: item)
        return controller
    }

}
