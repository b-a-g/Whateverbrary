//
//  LoginScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

class LoginScreenPresenter: ILoginScreenPresenter {
    
    private weak var view: ILoginScreenView?
    private let router: ILoginScreenRouter?
    
    init(router: ILoginScreenRouter) {
        self.router = router
    }
    
    func viewDidLoad(view: ILoginScreenView) {
        self.view = view
    }
    
    func login(login: String?, password: String?) {
        //
    }
    
    func signin(login: String?, password: String?) {
        //
    }
}
