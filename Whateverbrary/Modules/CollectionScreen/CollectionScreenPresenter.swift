//
//  CollectionScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

class CollectionScreenPresenter: ICollectionScreenPresenter {

    private weak var view: ICollectionScreenView?
    private let router: ICollectionScreenRouter
    private let itemStorage: IItemStorage
    private let configurationReader: IConfigurationReader
    private let user: UserModel
    private var items: [ItemModel]?

    init(router: ICollectionScreenRouter, itemStorage: IItemStorage, configurationReader: IConfigurationReader, user: UserModel) {
        self.router = router
        self.itemStorage = itemStorage
        self.configurationReader = configurationReader
        self.user = user
    }

    func viewDidLoad(view: ICollectionScreenView) {
        self.view = view
        self.getUserItems()
    }

    func onCollectionItemTap(item: UUID) {
        self.router.openDetailsScreen()
    }

    func onAddButtonTap() {
        self.router.openEditItemScreen(item: nil, state: .new)
    }

    private func getUserItems() {
        self.items = self.itemStorage.getItems(for: self.user)
    }

    private func convertToViewModel(item: ItemModel) -> CollectionScreenItemViewModel {
        return CollectionScreenItemViewModel(uid: item.uid, author: item.author, name: item.name, cover: "")
    }
}
