//
//  ILoginScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import UIKit

protocol ILoginScreenView: AnyObject {
    func showAlert(message: String)
    func setUserName(username: String)
}
