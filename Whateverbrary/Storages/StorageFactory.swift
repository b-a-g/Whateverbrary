//
//  StorageFactory.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 21.06.2021.
//

import Foundation

protocol IStorageFactory {
    func generatedStorage() -> IItemStorage & IUserStorage
}

final class StorageFactory: IStorageFactory {
    private let reader: IConfigurationReader
    
    init(reader: IConfigurationReader) {
        self.reader = reader
    }
    
    func generatedStorage() -> IItemStorage & IUserStorage {
        DataStorage()
    }
}
