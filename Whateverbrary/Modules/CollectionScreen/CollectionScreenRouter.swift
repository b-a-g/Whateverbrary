//
//  CollectionScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

class CollectionScreenRouter: ICollectionScreenRouter {

    let navigator: Navigator
    let user: UserModel

    init(navigator: Navigator, user: UserModel) {
        self.navigator = navigator
        self.user = user
    }

    func openNewItemScreen() {
        navigator.openNewItemScreen(user: user)
    }

    func openEditItemScreen(item: ItemModel) {
        navigator.openEditItemScreen(user: user)
    }
}
