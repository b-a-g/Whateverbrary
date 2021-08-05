//
//  CollectionDetailsScreenViewController.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionDetailsScreenViewController: UIViewController {

    private let detailsView: CollectionDetailsScreenView
    private let presenter: ICollectionDetailsScreenPresenter

    init(presenter: ICollectionDetailsScreenPresenter) {
        self.presenter = presenter
        self.detailsView = CollectionDetailsScreenView()
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
