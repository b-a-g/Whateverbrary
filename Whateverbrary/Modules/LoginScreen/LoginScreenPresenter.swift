//
//  LoginScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

class LoginScreenPresenter: ILoginScreenPresenter {

    private weak var view: ILoginScreenView?
    private let router: ILoginScreenRouter
    private let userDefaultsStorage: IUserDefaultsStorage

    init(userDefaultsStorage: IUserDefaultsStorage, router: ILoginScreenRouter) {
        self.userDefaultsStorage = userDefaultsStorage
        self.router = router
    }

    func viewDidLoad(view: ILoginScreenView) {
        self.view = view
    }

    func login(login: String?, password: String?) {
        if let login = login?.lowercased(),
           let password = password?.lowercased() {
            AuthService.authService.signIn(email: login, password: password)
            self.router.openUserScreen(user: UserModel(email: login, password: password))
        }
    }

    func signUp(login: String?, password: String?) {
        if let login = login?.lowercased(),
           let password = password?.lowercased() {
            AuthService.authService.signUp(email: login, password: password)
            self.router.openUserScreen(user: UserModel(email: login, password: password))
        }
    }
}
