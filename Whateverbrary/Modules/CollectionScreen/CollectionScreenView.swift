//
//  CollectionScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionScreenView: UICollectionView, ICollectionScreenView {

    weak var collectionScreenDelegate: ICollectionScreenViewDelegate?
    private var items = [ItemViewModel]()

    private let layout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 100, height: 200)
        layout.scrollDirection = .vertical
        return layout
    }()

    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = UIColor(rgb: 0x4959aa)
        delegate = self
        dataSource = self
        register(CollectionScreenItemCell.self, forCellWithReuseIdentifier: "cell")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func updateCollection(items: [ItemViewModel]) {
        self.items = items
        reloadData()
        setNeedsLayout()
        layoutIfNeeded()
    }
}

extension CollectionScreenView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        (cell as? CollectionScreenItemCell)?.update(viewModel: item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionScreenDelegate?.onCollectionItemTap(index: indexPath.row)
    }
}
