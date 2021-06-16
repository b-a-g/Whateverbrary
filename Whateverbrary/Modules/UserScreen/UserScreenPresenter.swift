//
//  UserScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import Foundation

class UserScreenPresenter: IUserScreenPresenter {

    private weak var view: IUserScreenView?
    private let router: IUserScreenRouter
    private let userDefaultStorage: IUserDefaultsStorage

    init(userDefaultStorage: IUserDefaultsStorage, router: IUserScreenRouter) {
        self.userDefaultStorage = userDefaultStorage
        self.router = router
    }

    func viewDidLoad(view: IUserScreenView) {
        self.view = view
    }

    func openCollection() {
        
    }

    func openFriendsList() {
        
    }

    func openBorrowedList() {
        
    }

    func openOwedList() {
        
    }

    func openNotificationsList() {
        
    }

    func signOut() {
        
    }
}
