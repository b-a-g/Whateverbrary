//
//  CoreDataStorage.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 21.06.2021.
//

import Foundation
import CoreData
import FirebaseDatabase

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

    //firebase
    private lazy var reference: DatabaseReference = {
        Database.database(url: "https://whateverbrary-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    }()

    private lazy var context: NSManagedObjectContext = {
        container.viewContext
    }()

    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    private func fetch<T>(_ request: NSFetchRequest<T>) -> [T] {
        (try? context.fetch(request)) ?? []
    }
}

extension DataStorage: IItemStorage {
    func getItems(for user: UserModel) -> [ItemModel] {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY owner.uid = '\(user.uid)'")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Item.name), ascending: true)]
        return self.fetch(fetchRequest).compactMap { ItemModel(item: $0) }
    }
    
    func createItem(item: ItemModel) {
        container.performBackgroundTask { _ in
            let fetchRequest: NSFetchRequest<AppUser> = AppUser.fetchRequest()

            guard let user = self.fetch(fetchRequest).first else { return }

            let object = Item(context: self.context)
            object.uid = item.uid
            object.name = item.name
            object.author = item.author
            object.owner = user.uid

            self.saveContext()
        }
    }

    func editItem(item: ItemModel) {
        container.performBackgroundTask { _ in
            let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "FIRST uid = '\(item.uid)'")
            guard let oldItem = self.fetch(fetchRequest).first else {return}

            oldItem.author = item.author
            oldItem.name = item.name

            self.saveContext()
        }
    }

    func getAllItems() -> [ItemModel] {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        return self.fetch(fetchRequest).compactMap {
            ItemModel(item: $0) }
    }
    
    func removeItem(item: ItemModel, completion: @escaping () -> Void) {
        //todo
    }
}

extension DataStorage: IUserStorage {
    func getUser(uid: String) -> UserModel? {
        let request: NSFetchRequest<AppUser> = AppUser.fetchRequest()
        request.predicate = NSPredicate(format: "\(#keyPath(AppUser.uid)) = '\(uid)'")
        guard let user = self.fetch(request).first else {return nil}
        if let uid = user.uid, let email = user.email {
            return UserModel(email: email, uid: uid)
        }
        else {
            return nil
        }
    }

    func getAllUsers() -> [AppUser] {
        let fetchRequest: NSFetchRequest<AppUser> = AppUser.fetchRequest()
        return self.fetch(fetchRequest)
    }

    func saveUser(user: UserModel, completion: (() -> Void)?) {
        //        self.container.performBackgroundTask { context in
        let object = AppUser(context: context)
        object.uid = user.uid
        object.email = user.email
        saveContext()
        //            DispatchQueue.main.async {
        //                if let completion = completion {
        //                    completion()
        //                }
        //            }
        //        }
    }
}
