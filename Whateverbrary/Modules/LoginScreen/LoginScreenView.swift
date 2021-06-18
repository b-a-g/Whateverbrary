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
        view.image = UIImage(named: "launchScreen")
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
        view.backgroundColor = .secondarySystemBackground
        view.placeholder = InterfaceConstants.emailInputFieldPlaceholder
        return view
    }()

    private lazy var passwordTextView: UITextField = {
        var view = TextFieldWithPadding()
        view.layer.cornerRadius = InterfaceConstants.defaultSmallCornerRadius
        view.backgroundColor = .secondarySystemBackground
        view.placeholder = InterfaceConstants.passwordInputfieldPlaceholder
        return view
    }()

    private lazy var signInButton: UIButton = {
        var view = UIButton(type: .system)
        view.layer.cornerRadius = InterfaceConstants.defaultSmallCornerRadius
        view.backgroundColor = .secondarySystemBackground
        view.setTitle(InterfaceConstants.signInButtonTitle, for: .normal)
        view.addTarget(self, action: #selector(self.onLoginClick), for: .touchUpInside)
        return view
    }()

    private lazy var signUpButton: UIButton = {
        var view = UIButton(type: .system)
        view.layer.cornerRadius = InterfaceConstants.defaultSmallCornerRadius
        view.backgroundColor = .secondarySystemBackground
        view.setTitle(InterfaceConstants.signUpButtonTitle, for: .normal)
        view.addTarget(self, action: #selector(self.onSigninClick), for: .touchUpInside)
        return view
    }()

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

private extension LoginScreenView {

    private func addSubviews() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.container)
        self.container.addArrangedSubview(self.loginTextView)
        self.container.addArrangedSubview(self.passwordTextView)
        self.container.addArrangedSubview(self.signInButton)
        self.container.addArrangedSubview(self.signUpButton)
    }

    private func makeConstraints() {
        self.backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        self.container.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.left.right.equalToSuperview().inset(50)
        }
    }

    @objc func onLoginClick() {
        self.delegate?.login(login: self.loginTextView.text, password: self.passwordTextView.text)
    }

    @objc func onSigninClick() {
        self.delegate?.signUp(login: self.loginTextView.text, password: self.passwordTextView.text)
    }
}
