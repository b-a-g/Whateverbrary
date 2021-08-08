//
//  ICollectionScreenViewDelegate.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

protocol ICollectionScreenViewDelegate: AnyObject {
    func onCollectionItemTap(index: Int)
    func onAddButtonTap()
}
