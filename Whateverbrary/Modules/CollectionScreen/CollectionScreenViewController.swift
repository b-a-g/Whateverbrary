//
//  CollectionScreenViewController.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionScreenViewController: UIViewController {

    private let collectionView: CollectionScreenView
    private let presenter: ICollectionScreenPresenter

    init(presenter: ICollectionScreenPresenter) {
        self.presenter = presenter
        self.collectionView = CollectionScreenView()
        super.init(nibName: nil, bundle: nil)
        self.collectionView.collectionScreenDelegate = self.presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = self.collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(view: self.collectionView)
        if let navController = self.navigationController {
            navController.navigationBar.isHidden = false
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                    target: self,
                    action: #selector(addButtonACtion))
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    @objc
    private func addButtonACtion() {
        self.presenter.onAddButtonTap()
    }
}
