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
    private let user: UserModel

    init(router: IUserScreenRouter, user: UserModel) {
        self.router = router
        self.user = user
    }

    func viewDidLoad(view: IUserScreenView) {
        self.view = view
        self.view?.setUser(user: user)
    }

    func onCollectionButtonTap(user: UserModel) {
        router.openCollectionScreen(user: user)
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
        router.openLoginScreen()
    }

    func onAvatarTap() {
        print("avatar tapped")
    }
}
