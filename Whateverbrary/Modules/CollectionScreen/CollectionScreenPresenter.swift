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

    init(router: ICollectionScreenRouter) {
        self.router = router
    }

    func viewDidLoad(view: ICollectionScreenView) {
        self.view = view
    }

    func onCollectionItemTap(item: UUID) {
        self.router.openDetailsScreen()
    }
}
