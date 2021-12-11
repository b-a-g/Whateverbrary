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
        collectionView = CollectionScreenView()
        super.init(nibName: nil, bundle: nil)
        collectionView.collectionScreenDelegate = self.presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: collectionView)
        if let navController = navigationController {
            navController.navigationBar.isHidden = false
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                     target: self,
                                                                     action: #selector(addButtonACtion))
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    @objc
    private func addButtonACtion() {
        presenter.onAddButtonTap()
    }
}
