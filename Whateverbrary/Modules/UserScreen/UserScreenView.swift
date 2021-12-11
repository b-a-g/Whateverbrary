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
    private var user: UserModel?

    private lazy var backgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "mainBackgroundImage")
        view.contentMode = .scaleAspectFill
        view.alpha = 0.5
        return view
    }()

    private lazy var userAvatar: BigButtonWithLabel = {
        var view = BigButtonWithLabel(title: "", imageName: "avatar1", target: self, action: #selector(onUserAvatarTap))
        view.setBackgrooundColor(color: InterfaceConstants.defaultBackgroundColor)
        return view
    }()

    private lazy var nicknameLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = InterfaceConstants.defaultBackgroundColor
        label.layer.cornerRadius = InterfaceConstants.defaultBigCornerRadius
        label.textAlignment = .center
        return label
    }()

    private lazy var mainButtonContainer: UIStackView = {
        var view = UIStackView()
        view.axis = .horizontal
        view.spacing = InterfaceConstants.defaultSpacing
        view.distribution = .fillEqually
        return view
    }()

    private lazy var leftButtonContainer: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.spacing = InterfaceConstants.defaultSpacing
        view.distribution = .fillEqually
        return view
    }()

    private lazy var rightButtonContainer: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.spacing = InterfaceConstants.defaultSpacing
        view.distribution = .fillEqually
        return view
    }()

    private lazy var collectionButton = BigButtonWithLabel(title: InterfaceConstants.collectionButtonTitle, imageName: "collection", target: self, action: #selector(onCollectionButtonTap))
    private lazy var friendsButton = BigButtonWithLabel(title: InterfaceConstants.friendsButtonTitle, imageName: "friends", target: self, action: #selector(onFriendsButtonTap))
    private lazy var owedButton = BigButtonWithLabel(title: InterfaceConstants.owedButtonTitle, imageName: "rent", target: self, action: #selector(onOwedButtonTap))
    private lazy var borrowedButton = BigButtonWithLabel(title: InterfaceConstants.borrowedButtonTitle, imageName: "rent", target: self, action: #selector(onBorrowedButtonTap))
    private lazy var notificationsButton = BigButtonWithLabel(title: InterfaceConstants.notificationsButtonTitle, imageName: "notification", target: self, action: #selector(onNotificationsButtonTap))
    private lazy var logoutButton = BigButtonWithLabel(title: InterfaceConstants.signOutButtonTitle, imageName: "logout", target: self, action: #selector(onLogoutButtonTap))

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserScreenView {

    func addSubviews() {
        addSubview(backgroundImage)
        addSubview(userAvatar)
        addSubview(nicknameLabel)
        addSubview(mainButtonContainer)
        mainButtonContainer.addArrangedSubview(leftButtonContainer)
        mainButtonContainer.addArrangedSubview(rightButtonContainer)
        leftButtonContainer.addArrangedSubview(collectionButton)
        leftButtonContainer.addArrangedSubview(owedButton)
        leftButtonContainer.addArrangedSubview(notificationsButton)
        rightButtonContainer.addArrangedSubview(friendsButton)
        rightButtonContainer.addArrangedSubview(borrowedButton)
        rightButtonContainer.addArrangedSubview(logoutButton)
    }

    func makeConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        userAvatar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(InterfaceConstants.defaultSpacing)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.height.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.5)
        }
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(userAvatar.snp.bottom).offset(InterfaceConstants.defaultSpacing)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(50)
            make.width.equalTo(userAvatar.snp.width)
        }
        mainButtonContainer.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(InterfaceConstants.defaultSpacing)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(InterfaceConstants.defaultSpacing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-InterfaceConstants.defaultSpacing)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-InterfaceConstants.defaultSpacing)
        }
    }

    @objc func onCollectionButtonTap() {
        if let user = user {
            delegate?.onCollectionButtonTap(user: user)
        }
    }

    @objc func onFriendsButtonTap() {
        delegate?.onFriendsButtonTap()
    }

    @objc func onOwedButtonTap() {
        delegate?.onOwedButtonTap()
    }

    @objc func onBorrowedButtonTap() {
        delegate?.onBorrowedButtonTap()
    }

    @objc func onNotificationsButtonTap() {
        delegate?.onNotificationsButtonTap()
    }

    @objc func onLogoutButtonTap() {
        delegate?.onLogoutButtonTap()
    }
    
    @objc func onUserAvatarTap() {
        delegate?.onAvatarTap()
    }

    func setUser(user: UserModel) {
        self.user = user
        nicknameLabel.text = self.user?.email
    }

    func setUserImage(image: UIImage) {
        userAvatar.setImage(image: image, state: .normal)
    }
}
