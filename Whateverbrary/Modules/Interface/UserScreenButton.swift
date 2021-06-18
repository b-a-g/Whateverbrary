//
//  UserScreenButton.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit

class UserScreenButton: UIButton {
    init(title: String, imageName: String, target: Any,action: Selector) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setImage(UIImage(named: imageName), for: .normal)
        backgroundColor = InterfaceConstants.blueBackgroundColor
        layer.cornerRadius = InterfaceConstants.defaultBigCornerRadius
        addTarget(target, action: action, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
