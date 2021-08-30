//
//  NewItemScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 06.08.2021.
//

import UIKit

public enum NewItemScreenStates {
    case new
    case edit
    case details
}

class NewItemScreenView: UIView {

    var saveDataHandler: ((_ item: ItemViewModel) -> Void)?
    private var item: ItemViewModel?

    private var itemNameLabel = UILabel(frame: .zero)
    private var editButton = UIButton(frame: .zero)
    private var submitButton = UIButton(frame: .zero)
    private var discardButton = UIButton(frame: .zero)

    init(state: NewItemScreenStates, item: ItemViewModel?) {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0x4959aa)
        switch state {
            case .new:
                self.createBlankView()
            case .edit:
                self.createEditView()
            case .details:
                self.createWatchView()
        }
        self.makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createBlankView() {
        let itemName = UILabel(frame: .zero)
        itemName.backgroundColor = .red
        self.itemNameLabel = itemName

        let button = UIButton(frame: .zero)
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(self.submitButtonAction), for: .touchUpInside)
        button.backgroundColor = .red
        self.submitButton = button

        addSubview(self.itemNameLabel)
        addSubview(self.submitButton)
    }

    private func createWatchView() {

    }

    private func createEditView() {

    }

    private func makeConstraints() {
        self.itemNameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        self.submitButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }

    @objc
    private func submitButtonAction() {
        if let item = self.item {
            self.saveDataHandler?(item)
        }
    }
}
