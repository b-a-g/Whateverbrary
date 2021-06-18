//
//  CollectionScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionScreenView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, ICollectionScreenView {
    
    weak var collectionScreenDelegate: ICollectionScreenViewDelegate?
    
    private lazy var backgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "mainBackgroundImage")
        view.contentMode = .scaleAspectFill
        view.alpha = 0.5
        return view
    }()
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .white
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(self.backgroundImage)
        self.backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let label = UILabel()
        label.text = "\(indexPath.row)"
        label.backgroundColor = InterfaceConstants.blueBackgroundColor
        cell.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionScreenDelegate?.onCollectionItemTap(at: indexPath)
    }
}
