//
//  NewItemScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import Foundation

class NewItemScreenRouter: INewItemScreenRouter {
    let navigator: Navigator
    let user: UserModel

    init(navigator: Navigator, user: UserModel) {
        self.navigator = navigator
        self.user = user
    }
}
