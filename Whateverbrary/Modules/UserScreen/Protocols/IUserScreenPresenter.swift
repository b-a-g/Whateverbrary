//
//  IUserScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import Foundation

protocol IUserScreenPresenter: IUserScreenViewDelegate {
    func viewDidLoad(view: IUserScreenView)
}
