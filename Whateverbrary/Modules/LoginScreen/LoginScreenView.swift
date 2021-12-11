//
//  LoginScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit
import SnapKit

class LoginScreenView: UIView {
    
    weak var delegate: ILoginScreenViewDelegate?
    
    private lazy var backgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "mainBackgroundImage")
        view.contentMode = .scaleAspectFill
        return view
    }()

    private lazy var container: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.spacing = InterfaceConstants.defaultSpacing
        return view
    }()

    private lazy var loginTextView: UITextField = {
        var view = TextFieldWithPadding()
        view.layer.cornerRadius = InterfaceConstants.defaultSmallCornerRadius
        view.backgroundColor = UIColor.secondarySystemBackground.withAlphaComponent(0.8)
        view.placeholder = InterfaceConstants.emailInputFieldPlaceholder
        return view
    }()

    private lazy var passwordTextView: UITextField = {
        var view = TextFieldWithPadding()
        view.layer.cornerRadius = InterfaceConstants.defaultSmallCornerRadius
        view.backgroundColor = UIColor.secondarySystemBackground.withAlphaComponent(0.8)
        view.placeholder = InterfaceConstants.passwordInputfieldPlaceholder
        return view
    }()

    private lazy var signInButton: UIButton = {
        var view = UIButton(type: .system)
        view.layer.cornerRadius = InterfaceConstants.defaultSmallCornerRadius
        view.backgroundColor = UIColor.secondarySystemBackground.withAlphaComponent(0.8)
        view.setTitle(InterfaceConstants.signInButtonTitle, for: .normal)
        view.addTarget(self, action: #selector(self.onLoginClick), for: .touchUpInside)
        return view
    }()

    private lazy var signUpButton: UIButton = {
        var view = UIButton(type: .system)
        view.layer.cornerRadius = InterfaceConstants.defaultSmallCornerRadius
        view.backgroundColor = UIColor.secondarySystemBackground.withAlphaComponent(0.8)
        view.setTitle(InterfaceConstants.signUpButtonTitle, for: .normal)
        view.addTarget(self, action: #selector(self.onSigninClick), for: .touchUpInside)
        return view
    }()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUserName(username: String) {
        loginTextView.text = username
    }

    func setPassword() {
        passwordTextView.text = "123456"
    }
}

private extension LoginScreenView {

    private func addSubviews() {
        addSubview(backgroundImage)
        addSubview(container)
        container.addArrangedSubview(loginTextView)
        container.addArrangedSubview(passwordTextView)
        container.addArrangedSubview(signInButton)
        container.addArrangedSubview(signUpButton)
    }

    private func makeConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        container.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.left.right.equalToSuperview().inset(50)
        }
    }

    @objc func onLoginClick() {
        delegate?.login(login: loginTextView.text, password: passwordTextView.text)
    }

    @objc func onSigninClick() {
        delegate?.signUp(login: loginTextView.text, password: passwordTextView.text)
    }
}
