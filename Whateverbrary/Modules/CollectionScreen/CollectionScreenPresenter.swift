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
    private var items: [ItemModel] = []

    init(router: ICollectionScreenRouter,
         itemStorage: IItemStorage,
         configurationReader: IConfigurationReader,
         user: UserModel) {
        self.router = router
        self.itemStorage = itemStorage
        self.configurationReader = configurationReader
        self.user = user
    }

    func viewDidLoad(view: ICollectionScreenView) {
        self.view = view
        self.getUserItems()
//        makeDataStub()
        let itemVM = ModelConverters.convertItemModelToViewModel(itemModel: self.items)
        self.view?.updateCollection(items: itemVM)
    }

    func onCollectionItemTap(index: Int) {
        if index < self.items.endIndex {
            self.router.openDetailsScreen(item: self.items[index])
        }
    }

    func onAddButtonTap() {
        self.router.openNewItemScreen()
    }

    private func getUserItems() {
        self.items = self.itemStorage.getItems(for: self.user)
    }

    private func makeDataStub() {
        let uuid = UUID()
        var itemsArr: [ItemModel] = []
        itemsArr.append(ItemModel(uid: uuid, owner: uuid,name: "Book0", author: "Author0"))
        itemsArr.append(ItemModel(uid: uuid, owner: uuid,name: "Book1", author: "Author1"))
        itemsArr.append(ItemModel(uid: uuid, owner: uuid,name: "Book2", author: "Author2"))
        itemsArr.append(ItemModel(uid: uuid, owner: uuid,name: "Book3", author: "Author3"))
        itemsArr.append(ItemModel(uid: uuid, owner: uuid,name: "Book4", author: "Author4"))
        self.items = itemsArr
    }
}
