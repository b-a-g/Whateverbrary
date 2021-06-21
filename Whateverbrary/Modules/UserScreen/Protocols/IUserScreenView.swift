//
//  IUserScreenView.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 16.06.2021.
//

import UIKit

protocol IUserScreenView: AnyObject {
    func setUsername(name: String)
    func setUserImage(image: UIImage)
}
