//
//  Navigator.swift
//  Whateverbrary
//
//  Created by Александр Беляев on 17.06.2021.
//

import UIKit

class Navigator {
    lazy var navigationController: UINavigationController = {
        let controller = LoginScreenAssembly().build(navigator: self)
        return UINavigationController(rootViewController: controller)
    }()
}

//MARK: login screen actions
extension Navigator {
    func openUserScreen(user: UserModel) {
        let viewController = UserScreenAssembly().build(navigator: self, user: user)
        self.navigationController.setViewControllers([viewController], animated: true)
    }
}

//MARK: user screen actions
extension Navigator {
    func openCollectionScreen(user: UserModel) {
        let viewController = CollectionScreenAssembly().build(navigator: self, user: user)
        self.navigationController.viewControllers.append(viewController)
    }

    func openFriendsScreen() {
        
    }

    func openOwedScreen() {
        
    }

    func openBorrowedScreen() {
        
    }

    func openNotificationsScreen() {

    }

    func openLoginScreen() {
        let viewController = LoginScreenAssembly().build(navigator: self)
        self.navigationController.setViewControllers([viewController], animated: true)
    }
}

//MARK: go to item screen
extension Navigator {
    func openDetailScren(user: UserModel) {
//        let viewController = NewItemScreenAssembly().build(navigator: self, user: user)
//        self.navigationController.present(viewController, animated: true, completion: nil)
    }

    func openNewItemScreen(user: UserModel) {
        let viewController = NewItemScreenAssembly().build(navigator: self, user: user)
        self.navigationController.viewControllers.append(viewController)
    }

    func openEditItemScreen(user: UserModel) {
//        let viewController = NewItemScreenAssembly().build(navigator: self, user: user)
//        self.navigationController.present(viewController, animated: true, completion: nil)
    }
}
