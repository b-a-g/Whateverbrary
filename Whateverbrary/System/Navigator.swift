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

    @objc
    private func backToUserScreen(user: UserModel) {
        self.openUserScreen(user: user)
    }

    @objc
    private func addNewItem(user: UserModel) {
        self.openNewItemScreen(user: user)
    }
}

//MARK: collection screen actions
extension Navigator {
    func openDetailScren(user: UserModel, item: ItemViewModel) {
        let viewController = ItemScreenAssembly().build(navigator: self, user: user, item: item, state: .details)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }

    func openNewItemScreen(user: UserModel) {
        let viewController = ItemScreenAssembly().build(navigator: self, user: user, item: nil, state: .new)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }

    func openEditItemScreen(user: UserModel, item: ItemViewModel) {
        let viewController = ItemScreenAssembly().build(navigator: self, user: user, item: item, state: .edit)
        self.navigationController.present(viewController, animated: true, completion: nil)
    }
}
