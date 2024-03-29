//
//  NewItemScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class NewItemScreenAssembly {
    func build(navigator: Navigator, user: UserModel) -> UIViewController {
        let itemStorage = AppDelegate.container.resolve(IItemStorage.self)!
        let presenter = NewItemScreenPresenter(user: user,
                                               itemStorage: itemStorage)
        let controller = NewItemScreenViewController(presenter: presenter)
        return controller
    }

}
