//
//  CollectionScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionScreenAssembly {
    func build(navigator: Navigator, user: UserModel) -> UIViewController {
        let configurationReader = AppDelegate.container.resolve(IConfigurationReader.self)!
        let itemStorage = AppDelegate.container.resolve(IItemStorage.self)!
        let router = CollectionScreenRouter(navigator: navigator, user: user)
        let presenter = CollectionScreenPresenter(router: router,
                                                  itemStorage: itemStorage,
                                                  configurationReader: configurationReader,
                                                  user: user)
        let controller = CollectionScreenViewController(presenter: presenter)
        return controller
    }
}
