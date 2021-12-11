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
        loginView = LoginScreenView()
        super.init(nibName: nil, bundle: nil)
        loginView.delegate = self.presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        if let navController = navigationController {
            navController.navigationBar.isHidden = true
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func setUserName(username: String) {
        loginView.setUserName(username: username)
    }

    func setPassword() {
        loginView.setPassword()
    }
}
