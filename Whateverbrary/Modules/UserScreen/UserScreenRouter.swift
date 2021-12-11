//
//  UserScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import Foundation

class UserScreenRouter: IUserScreenRouter {

    let navigator: Navigator
    let user: UserModel

    init(navigator: Navigator, user: UserModel) {
        self.navigator = navigator
        self.user = user
    }

    func openCollectionScreen(user: UserModel) {
        navigator.openCollectionScreen(user: user)
    }

    func openFriendsScreen() {
        navigator.openFriendsScreen()
    }

    func openOwedScreen() {
        navigator.openOwedScreen()
    }

    func openBorrowedScreen() {
        navigator.openBorrowedScreen()
    }

    func openNotificationsScreen() {
        navigator.openNotificationsScreen()
    }
    
    func openLoginScreen() {
        navigator.openLoginScreen()
    }

}
