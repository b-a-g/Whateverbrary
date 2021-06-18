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
        self.view?.setUsername(name: self.userDefaultStorage.lastEnteredPerson() ?? "unknown")
    }

    func onCollectionButtonTap() {
        self.router.openCollectionScreen()
    }
    
    func onFriendsButtonTap() {
        print("onFriendsButtonTap")
    }
    
    func onOwedButtonTap() {
        print("onOwedButtonTap")
    }
    
    func onBorrowedButtonTap() {
        print("onBorrowedButtonTap")
    }
    
    func onNotificationsButtonTap() {
        print("onNotificationsButtonTap")
    }
    
    func onLogoutButtonTap() {
        AuthService.authService.signOut()
        self.router.openLoginScreen()
    }
}
