//
//  INewItemScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 05.08.2021.
//

import Foundation

protocol INewItemScreenPresenter {
    func setUI(view: NewItemScreenView)
    func saveItem(item: ItemViewModel)
}
