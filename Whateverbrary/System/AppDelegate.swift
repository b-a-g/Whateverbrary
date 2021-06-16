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
    
    static let container = Container()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.initDependencies()
        FirebaseApp.configure()
        let controller = LoginScreenAssembly().build()
        let navigationVC = UINavigationController(rootViewController: controller)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationVC
        self.window?.makeKeyAndVisible()
        return true
    }
    
    static func initDependencies() {
        AppDelegate.container.register(IUserDefaultsStorage.self) { _ in
            return UserDefaultsStorage(userDefaults: .standard)
        }
    }


}

