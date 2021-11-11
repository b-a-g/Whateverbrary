//
//  ICollectionScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

protocol ICollectionScreenRouter {
    func openDetailsScreen(item: ItemModel)
    func openNewItemScreen(completion: @escaping (() -> Void))
    func openEditItemScreen(item: ItemModel)
}
