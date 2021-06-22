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
        self.navigator.openCollectionScreen(user: user)
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
    
    func openLoginScreen() {
        self.navigator.openLoginScreen()
    }

}
