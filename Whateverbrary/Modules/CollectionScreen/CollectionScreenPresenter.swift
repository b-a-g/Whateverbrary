//
//  CollectionScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation
import Alamofire

class CollectionScreenPresenter: ICollectionScreenPresenter {

    private weak var view: ICollectionScreenView?
    private let router: ICollectionScreenRouter
    private let itemStorage: IItemStorage
    private let userStorage: IUserStorage
    private let configurationReader: IConfigurationReader
    private let user: UserModel
    private var items: [ItemModel] = []

    init(router: ICollectionScreenRouter,
         itemStorage: IItemStorage,
         userStorage: IUserStorage,
         configurationReader: IConfigurationReader,
         user: UserModel) {
        self.router = router
        self.itemStorage = itemStorage
        self.userStorage = userStorage
        self.configurationReader = configurationReader
        self.user = user
    }

    func viewDidLoad(view: ICollectionScreenView) {
        self.view = view
        self.updateItemsAndShow()
    }

    func viewWillAppear() {
        self.updateItemsAndShow()
    }

    private func updateItemsAndShow() {
        self.getUserItems()
        let itemVM = ModelConverters.convertItemModelToViewModel(itemModel: self.items)
        self.view?.updateCollection(items: itemVM)
    }

    func onCollectionItemTap(index: Int) {
        if index < self.items.endIndex {
            self.router.openDetailsScreen(item: self.items[index])
        }
    }

    func onAddButtonTap() {
        self.router.openNewItemScreen { [weak self] in
            self?.updateItemsAndShow()
        }
    }

    private func getUserItems() {
        self.items = self.itemStorage.getItems(for: self.user)
    }

    private func makeDataStub() {
        let uuid = UUID().uuidString
        var itemsArr: [ItemModel] = []
        itemsArr.append(ItemModel(uid: uuid, owner: "abc",name: "Book0", author: "Author0"))
        itemsArr.append(ItemModel(uid: uuid, owner: "abc",name: "Book1", author: "Author1"))
        itemsArr.append(ItemModel(uid: uuid, owner: "abc",name: "Book2", author: "Author2"))
        itemsArr.append(ItemModel(uid: uuid, owner: "abc",name: "Book3", author: "Author3"))
        itemsArr.append(ItemModel(uid: uuid, owner: "abc",name: "Book4", author: "Author4"))
        self.items = itemsArr
    }
}
