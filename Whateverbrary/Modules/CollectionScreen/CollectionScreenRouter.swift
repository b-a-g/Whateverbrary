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
        self.navigator.openNewItemScreen(user: self.user)
    }

    func openEditItemScreen(item: ItemModel) {
        self.navigator.openEditItemScreen(user: self.user)
    }
}
