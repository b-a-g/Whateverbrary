//
//  EditItemScreenViewController.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 11.11.2021.
//

import UIKit

class EditItemScreenViewController: UIViewController {
    public let ui: EditItemScreenView
    private let presenter: IEditItemScreenPresenter

    init(presenter: IEditItemScreenPresenter) {
        self.presenter = presenter
        ui = EditItemScreenView()
        super.init(nibName: nil, bundle: nil)
        view = ui
        self.presenter.setUI(view: ui)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
