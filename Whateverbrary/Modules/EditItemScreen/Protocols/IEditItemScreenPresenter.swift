//
//  IEditItemScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 11.11.2021.
//

import Foundation

protocol IEditItemScreenPresenter {
    func setUI(view: EditItemScreenView)
    func saveItem(item: ItemViewModel)
}
