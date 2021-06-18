//
//  UserDefaultStorage.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 15.06.2021.
//

import Foundation

final class UserDefaultsStorage: IUserDefaultsStorage {

    enum Keys {
        static let lastOpenedUser = "lastOpenedUser"
    }

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func lastEnteredPerson() -> UUID? {
        return UUID(uuidString: self.userDefaults.string(forKey: Keys.lastOpenedUser) ?? "")
    }
}