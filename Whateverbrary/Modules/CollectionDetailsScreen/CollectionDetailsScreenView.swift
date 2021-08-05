//
//  CollectionDetailsScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import UIKit

class CollectionDetailsScreenView: UIView, ICollectionDetailsScreenView {
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0x4959aa)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
