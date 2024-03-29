//
//  ICollectionScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 18.06.2021.
//

import Foundation

protocol ICollectionScreenPresenter: ICollectionScreenViewDelegate {
    func viewDidLoad(view: ICollectionScreenView)
    func viewWillAppear()
}
