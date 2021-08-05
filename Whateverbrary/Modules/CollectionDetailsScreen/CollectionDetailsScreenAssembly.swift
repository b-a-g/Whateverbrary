//
//  CollectionDetailsScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionDetailsScreenAssembly {
    func build(navigator: Navigator) -> UIViewController {
//        let userDefaultStorage = AppDelegate.container.resolve(IUserDefaultsStorage.self)!
        let router = CollectionDetailsScreenRouter(navigator: navigator)
        let presenter = CollectionDetailsScreenPresenter(router: router)
        let controller = CollectionDetailsScreenViewController(presenter: presenter)
        return controller
    }
}
