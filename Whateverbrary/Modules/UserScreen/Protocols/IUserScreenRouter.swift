//
//  IUserScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import Foundation

protocol IUserScreenRouter {
    func openCollectionScreen(user: UserModel)
    func openFriendsScreen()
    func openOwedScreen()
    func openBorrowedScreen()
    func openNotificationsScreen()
    func openLoginScreen()
}
