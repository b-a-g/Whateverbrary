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
        ui = NewItemScreenView()
        super.init(nibName: nil, bundle: nil)
        view = ui
        self.presenter.setUI(view: ui)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
