//
//  NewItemScreenViewController.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class NewItemScreenViewController: UIViewController {
    private let detailsView: NewItemScreenView
    private let presenter: INewItemScreenPresenter

    init(presenter: INewItemScreenPresenter, state: NewItemScreenStates, item: ItemViewModel?) {
        self.presenter = presenter
        self.detailsView = NewItemScreenView(state: state, item: item)
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
