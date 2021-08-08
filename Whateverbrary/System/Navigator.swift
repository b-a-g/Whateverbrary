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
        self.navigationController.pushViewController(viewController, animated: true)
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

//MARK: collection screen actions
extension Navigator {
    func openDetailScren(item: ItemViewModel) {
        let viewController = ItemScreenAssembly().build(navigator: self, item: item, state: .details)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }

    func openNewItemScreen(item: ItemViewModel?, state: ItemScreenStates) {
        let viewController = ItemScreenAssembly().build(navigator: self, item: item, state: state)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }
}
