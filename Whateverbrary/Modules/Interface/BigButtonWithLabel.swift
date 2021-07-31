//
//  UserScreenButton.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit

class BigButtonWithLabel: UIView {
    private weak var button: UIButton?
    private weak var label: UILabel?
    private weak var stack: UIStackView?
    
    
    init(title: String, imageName: String, target: Any, action: Selector) {
        super.init(frame: .zero)
        createView(title: title, imageName: imageName, target: target, action: action)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView(title: String, imageName: String, target: Any, action: Selector) {
        createContainer()
        createButton(imageName: imageName, target: target, action: action)
        createLabel(title: title)
        makeConstraints()
    }
    
    func createContainer() {
        let stack = UIStackView(frame: .zero)
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.axis = .vertical
        self.stack = stack
        self.addSubview(stack)
    }
    
    private func createButton(imageName: String, target: Any, action: Selector) {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.backgroundColor = InterfaceConstants.blueBackgroundColor
        button.layer.cornerRadius = InterfaceConstants.defaultBigCornerRadius
        button.addTarget(target, action: action, for: .touchUpInside)
        
        self.button = button
        self.stack?.addArrangedSubview(button)
    }
    
    private func createLabel(title: String) {
        let label = UILabel(frame: .zero)
        label.text = title
        
        self.label = label
        self.stack?.addArrangedSubview(label)
    }
    
    private func makeConstraints() {
        self.stack?.snp.makeConstraints({ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        })
    }
}
