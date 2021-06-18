//
//  IUserDefaultStorage.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

protocol IUserDefaultsStorage {
    func lastEnteredPerson() -> UUID?
}
