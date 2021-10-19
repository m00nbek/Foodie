//
//  RootTabBarController.swift
//  RootTabBarController
//
//  Created by Oybek on 8/9/21.
//

import UIKit

class RootTabBarController: UITabBarController, RootViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupControllers()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        presenter?.presentWelcome(in: self)
    }
    // MARK: - Properties
    var presenter: RootPresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {
        view.backgroundColor = .white
        tabBar.backgroundColor = .clear
    }
    private func setupControllers() {
        let home = UINavigationController(rootViewController: HomeRouter.createHome())
        home.tabBarItem.image = Images.home
        home.tabBarItem.selectedImage = Images.homeSelected
        
        let wishlist = UINavigationController(rootViewController: WishlistRouter.createWishlist())
        wishlist.tabBarItem.image = Images.wishlist
        wishlist.tabBarItem.selectedImage = Images.wishlistSelected
        
        let orders = UINavigationController(rootViewController: OrdersRouter.createOrders())
        orders.tabBarItem.image = Images.orders
        orders.tabBarItem.selectedImage = Images.ordersSelected
        
        let profile = UINavigationController(rootViewController: ProfileRouter.createProfile())
        profile.tabBarItem.image = Images.profile
        profile.tabBarItem.selectedImage = Images.profileSelected
        
        viewControllers = [home, wishlist, orders, profile]
    }
}
