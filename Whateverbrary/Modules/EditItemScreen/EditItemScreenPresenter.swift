//
//  EditItemScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 11.11.2021.
//

import Foundation

class EditItemScreenPresenter: IEditItemScreenPresenter {

    private weak var view: EditItemScreenView?
    private let user: UserModel
    private let itemStorage: IItemStorage

    internal init(user: UserModel,
         itemStorage: IItemStorage) {
        self.user = user
        self.itemStorage = itemStorage

    }

    public func setUI(view: EditItemScreenView) {
        self.view = view
        self.view?.saveDataHandler = { [weak self] item in
            self?.saveItem(item: item)

        }
    }

    internal func saveItem(item: ItemViewModel) {
        let itemModel = ModelConverters.convertViewModelToModel(item: item, user: self.user)
        self.itemStorage.editItem(item: itemModel)
    }
}
