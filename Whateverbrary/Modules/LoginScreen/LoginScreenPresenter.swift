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
        let user = UserModel(email: "a.beljaev@cft.ru", password: "qwerty123")
        self.router.openUserScreen(user: user)
        print("login")
    }
    
    func signin(login: String?, password: String?) {
        //
    }
}
