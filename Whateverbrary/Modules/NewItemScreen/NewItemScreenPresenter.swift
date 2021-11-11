//
//  NewItemScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import Foundation

class NewItemScreenPresenter: INewItemScreenPresenter {

    private weak var view: NewItemScreenView?
    private let router: INewItemScreenRouter
    private let user: UserModel
    private let itemStorage: IItemStorage

    internal init(router: INewItemScreenRouter,
         user: UserModel,
         itemStorage: IItemStorage) {
        self.router = router
        self.user = user
        self.itemStorage = itemStorage

    }

    public func setUI(view: NewItemScreenView) {
        self.view = view
        self.view?.saveDataHandler = { [weak self] item in
            self?.saveItem(item: item)
            
        }
    }

    internal func saveItem(item: ItemViewModel) {
        let itemModel = ModelConverters.convertViewModelToModel(item: item, user: self.user)
        self.itemStorage.createItem(item: itemModel)
    }
}
