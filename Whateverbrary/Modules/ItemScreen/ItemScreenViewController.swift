//
//  ItemScreenViewController.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class ItemScreenViewController: UIViewController {
    private let detailsView: ItemScreenView
    private let presenter: IItemScreenPresenter

    init(presenter: IItemScreenPresenter) {
        self.presenter = presenter
        self.detailsView = ItemScreenView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = self.detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(view: self.detailsView)
    }

}
