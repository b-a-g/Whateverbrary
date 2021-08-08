//
//  ModelToViewModelConverters.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 08.08.2021.
//

import Foundation

public struct ModelToViewModelConverters {

    public static func convertItemModelToViewModel(itemModel: ItemModel) -> ItemViewModel {
        return ItemViewModel(uid: itemModel.uid, author: itemModel.author, name: itemModel.name, cover: "")
    }

}
