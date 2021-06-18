//
//  UserScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit

class UserScreenRouter: IUserScreenRouter {

    let navigator: Navigator
    init(navigator: Navigator) {
        self.navigator = navigator
    }

    func openCollectionScreen() {
        self.navigator.openCollectionScreen()
    }

    func openFriendsScreen() {
        self.navigator.openFriendsScreen()
    }

    func openOwedScreen() {
        self.navigator.openOwedScreen()
    }

    func openBorrowedScreen() {
        self.navigator.openBorrowedScreen()
    }

    func openNotificationsScreen() {
        self.navigator.openNotificationsScreen()
    }

}
