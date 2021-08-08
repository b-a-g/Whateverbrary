//
//  ModelToViewModelConverters.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 08.08.2021.
//

import Foundation

public struct ModelToViewModelConverters {

    public static func convertItemModelToViewModel(itemModel: [ItemModel]) -> [ItemViewModel] {
        var itemVM: [ItemViewModel] = []
        for item in itemModel {
            itemVM.append(ItemViewModel(uid: item.uid, author: item.author, name: item.name, cover: ""))
        }
        return itemVM
    }

    public static func convertItemModelToViewModel(itemModel: ItemModel) -> ItemViewModel {
            return ItemViewModel(uid: itemModel.uid, author: itemModel.author, name: itemModel.name, cover: "")
    }

}
