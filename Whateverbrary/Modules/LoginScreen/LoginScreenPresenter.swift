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
    private let userStorage: IUserStorage

    init(userDefaultsStorage: IUserDefaultsStorage, userStorage: IUserStorage, router: ILoginScreenRouter) {
        self.userDefaultsStorage = userDefaultsStorage
        self.userStorage = userStorage
        self.router = router
    }

    func viewDidLoad(view: ILoginScreenView) {
        self.view = view
        self.view?.setUserName(username: userDefaultsStorage.lastEnteredPerson() ?? "")
        self.view?.setPassword()
    }

    func login(login: String?, password: String?) {
        if let login = login?.lowercased(),
           let password = password {
            AuthService.authService.signIn(email: login, password: password) { user, error in
                if let user = user {
                    self.router.openUserScreen(user: UserModel(email: user.email ?? "", uid: user.uid))
                    self.userDefaultsStorage.setCurrentUser(email: user.email!)
                    if let email = user.email {
                        self.userStorage.saveUser(user: UserModel(email: email, uid: user.uid), completion: nil)
                    }
                } else if let error = error {
                    self.view?.showAlert(message: error)
                }
            }
        }
    }

    func signUp(login: String?, password: String?) {
        if let login = login?.lowercased(),
           let password = password {
            AuthService.authService.signUp(email: login, password: password) { user, error in
                if let user = user {
                    if let email = user.email {
                        self.userDefaultsStorage.setCurrentUser(email: email)
                        let newUser = UserModel(email: email, uid: user.uid)
                        self.userStorage.saveUser(user: newUser) {
                            self.router.openUserScreen(user: newUser)
                        }
                    }
                } else if let error = error {
                    
                    self.view?.showAlert(message: error)
                }
            }
        }
    }
}
