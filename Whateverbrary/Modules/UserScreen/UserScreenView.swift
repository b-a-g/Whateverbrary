//
//  UserScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit
import SnapKit

class UserScreenView: UIView, IUserScreenView {
    weak var delegate: IUserScreenViewDelegate?

    private lazy var userAvatar: UIImageView = {
        var imageView = UIImageView()
        
        return imageView
    }()

    private lazy var nicknameLabel: UILabel = {
        var label = UILabel()
        label.text = "NICKNAME"
        return label
    }()

    private lazy var buttonContainer: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.spacing = InterfaceConstants.defaultSpacing
        return view
    }()

    private lazy var collectionButton = UserScreenButton(title: InterfaceConstants.collectionButtonTitle, imageName: "", action: nil)

    private lazy var friendsButton = UserScreenButton(title: InterfaceConstants.friendsButtonTitle, imageName: "", action: nil)

    private lazy var owedButton = UserScreenButton(title: InterfaceConstants.owedButtonTitle, imageName: "", action: nil)

    private lazy var borrowedButton = UserScreenButton(title: InterfaceConstants.borrowedButtonTitle, imageName: "", action: nil)

    private lazy var notificationsButton = UserScreenButton(title: InterfaceConstants.notificationsButtonTitle, imageName: "", action: nil)

    private lazy var logoutButton = UserScreenButton(title: InterfaceConstants.signOutButtonTitle, imageName: "", action: nil)

    func addSubviews() {
        self.addSubview(self.userAvatar)
        self.addSubview(self.nicknameLabel)
        self.addSubview(self.buttonContainer)
        self.buttonContainer.addArrangedSubview(self.collectionButton)
        self.buttonContainer.addArrangedSubview(self.friendsButton)
        self.buttonContainer.addArrangedSubview(self.owedButton)
        self.buttonContainer.addArrangedSubview(self.borrowedButton)
        self.buttonContainer.addArrangedSubview(self.notificationsButton)
        self.buttonContainer.addArrangedSubview(self.logoutButton)
    }

    func makeConstraints() {
        self.userAvatar.snp.makeConstraints { make in
            make.height.width.equalTo(self.bounds.width/3)
            make.centerX.equalTo(self.snp_centerXWithinMargins)
            make.top.equalTo(self.snp.topMargin).offset(InterfaceConstants.defaultSpacing)
        }
        self.nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.userAvatar.snp.bottomMargin).offset(InterfaceConstants.defaultSpacing)
            make.width.equalTo(self.userAvatar.snp.width)
            make.centerX.equalTo(self.snp.centerXWithinMargins)
        }
        self.buttonContainer.snp.makeConstraints { make in
            make.top.equalTo(self.nicknameLabel.snp.bottom)
            make.left.right.bottom.equalToSuperview().offset(InterfaceConstants.defaultSpacing)
        }
    }
}
