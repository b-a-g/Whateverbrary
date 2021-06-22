//
//  CollectionScreenItemCell.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 22.06.2021.
//

import UIKit

final class CollectionScreenItemCell: UICollectionViewCell {

    private var cover = UIImageView()
    private var author = UILabel()
    private var name = UILabel()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        makeConstraints()
    }

    private func configureCell() {
        self.addSubview(self.cover)
        self.addSubview(self.author)
        self.addSubview(self.name)
    }

    private func makeConstraints() {
        self.cover.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        self.name.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5)
        }
        self.author.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10)
        }
    }

    func update(viewModel: CollectionScreenItemViewModel) {
        self.cover.image = UIImage(named: viewModel.cover)
        self.author.text = viewModel.author
        self.name.text = viewModel.name
    }
}
