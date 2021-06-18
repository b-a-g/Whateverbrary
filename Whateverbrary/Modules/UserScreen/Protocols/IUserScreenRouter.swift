//
//  IUserScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import Foundation

protocol IUserScreenRouter {
    func openCollectionScreen()
    func openFriendsScreen()
    func openOwedScreen()
    func openBorrowedScreen()
    func openNotificationsScreen()
    func openLoginScreen()
}
