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
//    private let item: ItemModel

    init(router: IItemScreenRouter) {
        self.router = router
//        self.item = item
    }

    func viewDidLoad(view: ItemScreenView) {
        self.view = view
    }
}
