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

    lazy var backButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToUserScreen))
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
        self.navigationController.navigationBar.isHidden = false
        self.navigationController.setToolbarItems([backButtonItem], animated: false)
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

    @objc
    private func backToUserScreen(user: UserModel) {
        self.openUserScreen(user: user)
    }
}

//MARK: collection screen actions
extension Navigator {
    func openDetailScren(item: ItemViewModel) {
        let viewController = ItemScreenAssembly().build(navigator: self, item: item, state: .details)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }

    func openNewItemScreen() {
        let viewController = ItemScreenAssembly().build(navigator: self, item: nil, state: .new)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }

    func openEditItemScreen(item: ItemViewModel) {
        let viewController = ItemScreenAssembly().build(navigator: self, item: item, state: .edit)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }
}
