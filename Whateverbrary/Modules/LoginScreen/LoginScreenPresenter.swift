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
        self.view?.setUserName(username: self.userDefaultsStorage.lastEnteredPerson() ?? "")
    }

    func login(login: String?, password: String?) {
        if let login = login?.lowercased(),
           let password = password?.lowercased() {
            AuthService.authService.signIn(email: login, password: password) { user, error in
                if let user = user {
                    self.router.openUserScreen(user: UserModel(email: user.email ?? "", password: password))
                    self.userDefaultsStorage.setCurrentUser(email: user.email!)
                } else if let error = error {
                    self.view?.showAlert(message: error.localizedDescription)
                }
            }
        }
    }

    func signUp(login: String?, password: String?) {
        if let login = login?.lowercased(),
           let password = password?.lowercased() {
            AuthService.authService.signUp(email: login, password: password) { user, error in
                if let user = user {
                    self.router.openUserScreen(user: UserModel(email: user.email ?? "", password: password))
                    self.userDefaultsStorage.setCurrentUser(email: user.email ?? "")
                } else if let error = error {
                    self.view?.showAlert(message: error.localizedDescription)
                }
            }
        }
    }
}
