//
//  ItemScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import Foundation

class ItemScreenPresenter: IItemScreenPresenter {
    private weak var view: ItemScreenView?
    private let router: IItemScreenRouter
    private let item: ItemViewModel?
    private let user: UserModel

    init(router: IItemScreenRouter, user: UserModel, item: ItemViewModel?) {
        self.router = router
        self.user = user
        self.item = item
    }

    func viewDidLoad(view: ItemScreenView) {
        self.view = view
    }
}
