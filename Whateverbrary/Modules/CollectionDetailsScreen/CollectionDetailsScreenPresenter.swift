//
//  CollectionDetailsScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

class CollectionDetailsScreenPresenter: ICollectionDetailsScreenPresenter {

    private weak var view: ICollectionDetailsScreenView?
    private let router: ICollectionDetailsScreenRouter
//    private let item: ItemModel

    init(router: ICollectionDetailsScreenRouter) {
        self.router = router
//        self.item = item
    }

    func viewDidLoad(view: ICollectionDetailsScreenView) {
        self.view = view
    }
}
