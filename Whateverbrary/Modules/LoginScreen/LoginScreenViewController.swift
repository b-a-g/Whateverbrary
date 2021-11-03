//
//  LoginScreenViewController.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit
//todo: Точно ли тут должен быть ILoginScreenView?

class LoginScreenViewController: UIViewController, ILoginScreenView {

    private let loginView: LoginScreenView
    private let presenter: ILoginScreenPresenter
    
    init(presenter: ILoginScreenPresenter) {
        self.presenter = presenter
        self.loginView = LoginScreenView()
        super.init(nibName: nil, bundle: nil)
        self.loginView.delegate = self.presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(view: self)
        if let navController = self.navigationController {
            navController.navigationBar.isHidden = true
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUserName(username: String) {
        self.loginView.setUserName(username: username)
    }

    func setPassword() {
        self.loginView.setPassword()
    }
}
