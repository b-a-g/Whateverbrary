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

    private lazy var container: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.spacing = InterfaceConstants.defaultSpacing
        return view
    }()

    private lazy var loginTextView: UITextField = {
        var view = TextFieldWithPadding()
        view.backgroundColor = InterfaceConstants.defaultBackgroundColor
        view.placeholder = "Email"
        return view
    }()

    private lazy var passwordTextView: UITextField = {
        var view = TextFieldWithPadding()
        view.backgroundColor = InterfaceConstants.defaultBackgroundColor
        view.placeholder = "Password"
        return view
    }()

    private lazy var loginButton: UIButton = {
        var view = UIButton(type: .system)
        view.setTitle("Log in", for: .normal)
        view.addTarget(self, action: #selector(self.onLoginClick), for: .touchUpInside)
        return view
    }()

    private lazy var signinButton: UIButton = {
        var view = UIButton(type: .system)
        view.setTitle("Sign in", for: .normal)
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
        self.addSubview(self.container)
        self.container.addArrangedSubview(self.loginTextView)
        self.container.addArrangedSubview(self.passwordTextView)
        self.container.addArrangedSubview(self.loginButton)
        self.container.addArrangedSubview(self.signinButton)
    }

    private func makeConstraints() {
        self.container.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }

    @objc func onLoginClick() {
        self.delegate?.login(login: self.loginTextView.text, password: self.passwordTextView.text)
    }

    @objc func onSigninClick() {
        self.delegate?.signin(login: self.loginTextView.text, password: self.passwordTextView.text)
    }
}
