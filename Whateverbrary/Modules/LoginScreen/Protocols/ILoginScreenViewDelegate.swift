//
//  ILoginScreenViewDelegate.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

protocol ILoginScreenViewDelegate: AnyObject {
    func login(login: String?, password: String?)
    func signUp(login: String?, password: String?)
}
