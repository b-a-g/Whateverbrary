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
        let viewController = UserScreenAssembly().build(navigator: self)
        self.navigationController.setViewControllers([viewController], animated: true)
    }
}

//MARK: user screen actions
extension Navigator {
    func openCollectionScreen() {
        let viewController = CollectionScreenAssembly().build(navigator: self)
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

//MARK: collection screen actions
extension Navigator {
    func openDetailScren() {
        
    }
}
