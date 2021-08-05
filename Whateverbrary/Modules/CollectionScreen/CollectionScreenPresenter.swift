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
    private let items: [ItemModel] = []

    init(router: ICollectionScreenRouter, itemStorage: IItemStorage, configurationReader: IConfigurationReader, user: UserModel) {
        self.router = router
        self.itemStorage = itemStorage
        self.configurationReader = configurationReader
        self.user = user
    }

    func viewDidLoad(view: ICollectionScreenView) {
        self.view = view
    }

    func onCollectionItemTap(item: UUID) {
        guard let item = self.items.first(where: { $0.uid == item }) else
        {
            print("Item not found")
            return
        }
        self.router.openDetailsScreen(item: item)
    }
}
