//
//  AppDelegate.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 01.06.2021.
//

import UIKit
import CoreData
import Swinject
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let naviagtor = Navigator()
    static let container = Container()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.initDependencies()
        FirebaseApp.configure()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.naviagtor.navigationController
        self.window?.makeKeyAndVisible()
        return true
    }

    static func initDependencies() {
        AppDelegate.container.register(IUserDefaultsStorage.self) { _ in
            return UserDefaultsStorage(userDefaults: .standard)
        }
        AppDelegate.container.register(IConfigurationReader.self) { _ in
            ConfigurationReader()
        }
        let configurationReader = AppDelegate.container.resolve(IConfigurationReader.self)!
        let storage = StorageFactory(reader: configurationReader).generatedStorage()
        AppDelegate.container.register(IItemStorage.self) { _ in
            return storage
        }.inObjectScope(.container)
        AppDelegate.container.register(IUserStorage.self) { _ in
            return storage
        }.inObjectScope(.container)
    }
}
