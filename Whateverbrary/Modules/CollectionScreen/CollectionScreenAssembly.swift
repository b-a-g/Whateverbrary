//
//  CollectionScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionScreenAssembly {
    func build(navigator: Navigator, user: UserModel) -> UIViewController {
        let router = CollectionScreenRouter(navigator: navigator)
        let presenter = CollectionScreenPresenter(router: router)
        let controller = CollectionScreenViewController(presenter: presenter)
        return controller
    }
}
