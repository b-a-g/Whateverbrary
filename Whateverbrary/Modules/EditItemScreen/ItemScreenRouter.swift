//
//  ItemScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import Foundation

class ItemScreenRouter: IItemScreenRouter {
    let navigator: Navigator

    init(navigator: Navigator) {
        self.navigator = navigator
    }
}
