//
//  EditItemScreenAssembly.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 11.11.2021.
//

import UIKit

class EditItemScreenAssembly {
    func build(navigator: Navigator, user: UserModel) -> UIViewController {
        let itemStorage = AppDelegate.container.resolve(IItemStorage.self)!
        let presenter = EditItemScreenPresenter(user: user,
                                               itemStorage: itemStorage)
        let controller = EditItemScreenViewController(presenter: presenter)
        return controller
    }

}
