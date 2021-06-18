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
    private let userDefaultStorage: IUserDefaultsStorage

    init(userDefaultStorage: IUserDefaultsStorage, router: ICollectionScreenRouter) {
        self.userDefaultStorage = userDefaultStorage
        self.router = router
    }

    func viewDidLoad(view: ICollectionScreenView) {
        self.view = view
    }

    func onCollectionItemTap(at: IndexPath) {
        //
    }
}
