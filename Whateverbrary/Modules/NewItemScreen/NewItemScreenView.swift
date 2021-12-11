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
        createBlankView()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createBlankView() {
        author.placeholder = "Автор"
        name.placeholder = "Название"
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)

        addSubview(author)
        addSubview(name)
        addSubview(submitButton)
    }

    private func makeConstraints() {
        author.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(author.snp.bottom).offset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        submitButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }

    @objc
    private func submitButtonAction() {
        let item = ItemViewModel(uid: UUID().uuidString, author: author.text ?? "", name: name.text ?? "", cover: "")
        saveDataHandler?(item)
    }
}
