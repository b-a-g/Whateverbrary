//
//  CollectionScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

class CollectionScreenRouter: ICollectionScreenRouter {

    let navigator: Navigator
    init(navigator: Navigator) {
        self.navigator = navigator
    }

    func openDetailsScreen() {
        self.navigator.openDetailScren()
    }
}
