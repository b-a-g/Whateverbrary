//
//  IItemStorage.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 21.06.2021.
//

import Foundation

protocol IItemStorage {
    func getAllItems() -> [ItemModel]
    func getItems(for user: UserModel) -> [ItemModel]
    func createItem(item: ItemModel)
    func removeItem(item: ItemModel, completion: @escaping () -> Void)
}
