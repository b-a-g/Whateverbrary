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
        let itemViewModel = ModelToViewModelConverters.convertItemModelToViewModel(itemModel: item)
        self.navigator.openDetailScren(item: itemViewModel)
    }

    func openNewItemScreen() {
        self.navigator.openNewItemScreen()
    }

    func openEditItemScreen(item: ItemViewModel, state: ItemScreenStates) {
        self.navigator.openEditItemScreen(item: item)
    }
}
