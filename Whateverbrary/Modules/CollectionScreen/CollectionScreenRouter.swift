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

    func openDetailsScreen(item: ItemModel) {
        self.navigator.openDetailScren()
    }

    func openDetailsScreen() {
        self.navigator.openDetailScren()
    }

    func openEditItemScreen(item: CollectionScreenItemViewModel?, state: EditItemScreenStates) {
        self.navigator.openNewItemScreen(item: item, state: state)
    }
}
