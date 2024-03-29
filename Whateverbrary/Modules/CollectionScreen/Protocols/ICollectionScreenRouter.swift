//
//  ICollectionScreenRouter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

protocol ICollectionScreenRouter {
    func openNewItemScreen()
    func openEditItemScreen(item: ItemModel)
}
