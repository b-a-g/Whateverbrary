//
//  NewItemScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class NewItemScreenAssembly {
    func build(navigator: Navigator, user: UserModel, completion: @escaping (() -> Void)) -> UIViewController {
        let itemStorage = AppDelegate.container.resolve(IItemStorage.self)!
        let router = NewItemScreenRouter(navigator: navigator, user: user)
        let presenter = NewItemScreenPresenter(router: router,
                                               user: user,
                                               itemStorage: itemStorage,
                                               completion: completion)
        let controller = NewItemScreenViewController(presenter: presenter)
        return controller
    }

}
