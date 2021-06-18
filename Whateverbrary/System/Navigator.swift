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

    func openUserScreen(user: UserModel) {
        let viewController = UserScreenAssembly().build(navigator: self)
        self.navigationController.setViewControllers([viewController], animated: true)
    }

    func openCollectionScreen() {
        let viewController = UserScreenAssembly().build(navigator: self)
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
}
