//
//  ItemScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

public enum ItemScreenStates {
    case new
    case edit
    case details
}

class ItemScreenView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0x4959aa)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
