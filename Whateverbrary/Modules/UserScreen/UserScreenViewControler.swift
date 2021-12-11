//
//  UserScreenViewControler.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit

class UserScreenViewController: UIViewController {

    private let userView: UserScreenView
    private let presenter: IUserScreenPresenter
    
    init(presenter: IUserScreenPresenter) {
        self.presenter = presenter
        userView = UserScreenView()
        super.init(nibName: nil, bundle: nil)
        userView.delegate = self.presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: userView)
    }
}
