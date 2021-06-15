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

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let container = Container()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.initDependencies()
        FirebaseApp.configure()
        return true
    }
    
    static func initDependencies() {
        
    }


}

