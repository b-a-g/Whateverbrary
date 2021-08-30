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
    private let item: ItemViewModel?
    private let user: UserModel

    init(router: INewItemScreenRouter, user: UserModel, item: ItemViewModel?) {
        self.router = router
        self.user = user
        self.item = item
    }

    func viewDidLoad(view: NewItemScreenView) {
        self.view = view
//        self.view?.saveDataHandler = { [weak self] in
//
//        }
    }
}
