//
//  NewItemScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

class NewItemScreenView: UIView {

    var saveDataHandler: ((_ item: ItemViewModel) -> Void)?

    private var itemNameLabel = UILabel(frame: .zero)
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
        let itemName = UILabel(frame: .zero)
        itemName.backgroundColor = .red
        itemName.text = "TEMPLATE"
        self.itemNameLabel = itemName

        let button = UIButton(frame: .zero)
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(self.submitButtonAction), for: .touchUpInside)
        button.backgroundColor = .red
        self.submitButton = button

        addSubview(self.itemNameLabel)
        addSubview(self.submitButton)
    }

    private func makeConstraints() {
        self.itemNameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        self.submitButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }

    @objc
    private func submitButtonAction() {
        let item = ItemViewModel(uid: UUID().uuidString, author: "", name: self.itemNameLabel.text ?? "", cover: "")
        self.saveDataHandler?(item)
    }
}
