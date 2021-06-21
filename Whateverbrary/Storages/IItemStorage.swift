//
//  IItemStorage.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 21.06.2021.
//

import Foundation

protocol IItemStorage {
    func getItems(for user: UserModel) -> [ItemModel]
    func createItem(item: ItemModel, completion: @escaping () -> Void)
    func removeItem(item: ItemModel, completion: @escaping () -> Void)
}
