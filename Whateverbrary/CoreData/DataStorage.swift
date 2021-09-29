//
//  CoreDataStorage.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 21.06.2021.
//

import Foundation
import CoreData

final class DataStorage {
    private enum Constants {
        static let containerName = "DataBase"
        static let entityName = "Item"
    }
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.containerName)
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error \(error)")
        })
        return container
    }()
}

extension DataStorage: IItemStorage {
    func getItems(for user: UserModel) -> [ItemModel] {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY owner.uid = '\(user.uid)'")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Item.name), ascending: true)]
        return (try? self.container.viewContext.fetch(fetchRequest).compactMap {
                    ItemModel(item: $0) }) ?? []
    }
    
    func createItem(item: ItemModel) {
        self.container.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<AppUser> = AppUser.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "\(#keyPath(AppUser.uid)) = '\(item.owner)'")
            guard let user = try! context.fetch(fetchRequest).first else { return }
            let object = Item(context: context)
            object.uid = item.uid
            object.name = item.name
            object.author = item.author
            object.owner = user.uid
            try! context.save()
        }
    }
    
    func removeItem(item: ItemModel, completion: @escaping () -> Void) {
        //todo
    }
}

extension DataStorage: IUserStorage {
    func getUser() -> UserModel? {
        return UserModel(email: "jopa@jopa.jo")
    }

    func saveUser(user: UserModel, completion: @escaping () -> Void) {
        self.container.performBackgroundTask { context in
            let object = AppUser(context: context)
            object.uid = user.uid
            object.email = user.email
            try? context.save()
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
