//
//  NewItemScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class NewItemScreenView: UIView {

    var saveDataHandler: ((_ item: ItemViewModel) -> Void)?

    private var author = UITextField(frame: .zero)
    private var name = UITextField(frame: .zero)
    private var submitButton = UIButton(frame: .zero)

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0x4959aa)
        self.createBlankView()
        self.makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createBlankView() {
        self.author.placeholder = "Автор"
        self.name.placeholder = "Название"
        self.submitButton.setTitle("Submit", for: .normal)
        self.submitButton.addTarget(self, action: #selector(self.submitButtonAction), for: .touchUpInside)

        addSubview(self.author)
        addSubview(self.name)
        addSubview(self.submitButton)
    }

    private func makeConstraints() {
        self.author.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        self.name.snp.makeConstraints { make in
            make.top.equalTo(self.author.snp.bottom).offset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        self.submitButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }

    @objc
    private func submitButtonAction() {
        let item = ItemViewModel(uid: UUID().uuidString, author: self.author.text ?? "", name: self.name.text ?? "", cover: "")
        self.saveDataHandler?(item)
    }
}
