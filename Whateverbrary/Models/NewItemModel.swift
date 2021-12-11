//
//  NewItemModel.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 21.06.2021.
//

import Foundation

public final class ItemModel {
    let uid: String
    let owner: String
    private(set) var name: String
    private(set) var author: String

    init(owner: String, name: String, author: String) {
        uid = UUID().uuidString
        self.owner = owner
        self.name = name
        self.author = author
    }

    init(uid: String, owner: String, name: String, author: String) {
        self.uid = uid
        self.owner = owner
        self.name = name
        self.author = author
    }

    init?(item: Item) {
        guard let uid = item.uid,
              let owner = item.owner,
              let author = item.author,
              let name = item.name
        else { return nil }
        self.uid = uid
        self.owner = owner
        self.author = author
        self.name = name
    }
}
