//
//  ILoginScreenPresenter.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

protocol ILoginScreenPresenter: ILoginScreenViewDelegate {
    func viewDidLoad(view: ILoginScreenView)
}
