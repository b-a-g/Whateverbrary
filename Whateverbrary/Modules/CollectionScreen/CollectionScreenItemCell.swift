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
        backgroundColor = .lightGray
        configureCell()
        makeConstraints()
    }

    private func configureCell() {
        addSubview(cover)
        addSubview(author)
        addSubview(name)
    }

    private func makeConstraints() {
        cover.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        name.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5)
        }
        author.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10)
        }
    }

    func update(viewModel: ItemViewModel) {
        cover.image = UIImage(named: viewModel.cover)
        author.text = viewModel.author
        name.text = viewModel.name
    }
}
