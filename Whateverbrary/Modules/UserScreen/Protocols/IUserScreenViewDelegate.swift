//
//  IUserScreenViewDelegate.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import Foundation

protocol IUserScreenViewDelegate: AnyObject {
    func onCollectionButtonTap()
    func onFriendsButtonTap()
    func onOwedButtonTap()
    func onBorrowedButtonTap()
    func onNotificationsButtonTap()
    func onLogoutButtonTap()
}
