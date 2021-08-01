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

    private lazy var collectionButton = BigButtonWithLabel(title: InterfaceConstants.collectionButtonTitle, imageName: "collection", target: self, action: #selector(self.onCollectionButtonTap))
    private lazy var friendsButton = BigButtonWithLabel(title: InterfaceConstants.friendsButtonTitle, imageName: "friends", target: self, action: #selector(self.onFriendsButtonTap))
    private lazy var owedButton = BigButtonWithLabel(title: InterfaceConstants.owedButtonTitle, imageName: "rent", target: self, action: #selector(self.onOwedButtonTap))
    private lazy var borrowedButton = BigButtonWithLabel(title: InterfaceConstants.borrowedButtonTitle, imageName: "rent", target: self, action: #selector(self.onBorrowedButtonTap))
    private lazy var notificationsButton = BigButtonWithLabel(title: InterfaceConstants.notificationsButtonTitle, imageName: "notification", target: self, action: #selector(self.onNotificationsButtonTap))
    private lazy var logoutButton = BigButtonWithLabel(title: InterfaceConstants.signOutButtonTitle, imageName: "logout", target: self, action: #selector(self.onLogoutButtonTap))

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubviews()
        self.makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserScreenView {

    func addSubviews() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.userAvatar)
        self.addSubview(self.nicknameLabel)
        self.addSubview(self.mainButtonContainer)
        self.mainButtonContainer.addArrangedSubview(self.leftButtonContainer)
        self.mainButtonContainer.addArrangedSubview(self.rightButtonContainer)
        self.leftButtonContainer.addArrangedSubview(self.collectionButton)
        self.leftButtonContainer.addArrangedSubview(self.owedButton)
        self.leftButtonContainer.addArrangedSubview(self.notificationsButton)
        self.rightButtonContainer.addArrangedSubview(self.friendsButton)
        self.rightButtonContainer.addArrangedSubview(self.borrowedButton)
        self.rightButtonContainer.addArrangedSubview(self.logoutButton)
    }

    func makeConstraints() {
        self.backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        self.userAvatar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(InterfaceConstants.defaultSpacing)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.height.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.5)
        }
        self.nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.userAvatar.snp.bottom).offset(InterfaceConstants.defaultSpacing)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(50)
            make.width.equalTo(self.userAvatar.snp.width)
        }
        self.mainButtonContainer.snp.makeConstraints { make in
            make.top.equalTo(self.nicknameLabel.snp.bottom).offset(InterfaceConstants.defaultSpacing)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(InterfaceConstants.defaultSpacing)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-InterfaceConstants.defaultSpacing)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(-InterfaceConstants.defaultSpacing)
        }
    }

    @objc func onCollectionButtonTap() {
        if let user = self.user {
            self.delegate?.onCollectionButtonTap(user: user)
        }
    }

    @objc func onFriendsButtonTap() {
        self.delegate?.onFriendsButtonTap()
    }

    @objc func onOwedButtonTap() {
        self.delegate?.onOwedButtonTap()
    }

    @objc func onBorrowedButtonTap() {
        self.delegate?.onBorrowedButtonTap()
    }

    @objc func onNotificationsButtonTap() {
        self.delegate?.onNotificationsButtonTap()
    }

    @objc func onLogoutButtonTap() {
        self.delegate?.onLogoutButtonTap()
    }
    
    @objc func onUserAvatarTap() {
        self.delegate?.onAvatarTap()
    }

    func setUser(user: UserModel) {
        self.user = user
        self.nicknameLabel.text = self.user?.email
    }

    func setUserImage(image: UIImage) {
        self.userAvatar.setImage(image: image, state: .normal)
    }
}
