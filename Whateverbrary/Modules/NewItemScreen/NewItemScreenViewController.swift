//
//  NewItemScreenViewController.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class NewItemScreenViewController: UIViewController {
    public let ui: NewItemScreenView
    private let presenter: INewItemScreenPresenter

    init(presenter: INewItemScreenPresenter) {
        self.presenter = presenter
        self.ui = NewItemScreenView()
        super.init(nibName: nil, bundle: nil)
        self.view = self.ui
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.presenter.viewDidLoad(view: self.ui)
        super.viewDidLoad()
    }

}
