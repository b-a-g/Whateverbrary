//
//  NewItemScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import Foundation

class NewItemScreenPresenter: INewItemScreenPresenter {

    private weak var view: NewItemScreenView?
    private let user: UserModel
    private let itemStorage: IItemStorage

    internal init(user: UserModel,
         itemStorage: IItemStorage) {
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
        let itemModel = ModelConverters.convertViewModelToModel(item: item, user: user)
        itemStorage.createItem(item: itemModel)
    }
}
