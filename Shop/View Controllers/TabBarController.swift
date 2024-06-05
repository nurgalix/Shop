//
//  TabBarController.swift
//  Shop
//
//  Created by Nurgali on 03.06.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        
        self.tabBar.barTintColor = .red
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .black
    }
    
    
    // MARK: - Tab Setup
    private func setupTabs() {
        
        let homeVC = HomeViewController()
        let navone = UINavigationController(rootViewController: homeVC)
        navone.tabBarItem.title = "Home"
        navone.tabBarItem.image = UIImage(systemName: "house")
        navone.viewControllers.first?.navigationItem.title = "Shop"
        
        let cartVC = BasketViewController()
        let navsec = UINavigationController(rootViewController: cartVC)
        navsec.tabBarItem.title = "Basket"
        navsec.tabBarItem.image = UIImage(systemName: "basket")
        navsec.viewControllers.first?.navigationItem.title = "Details"
        
        self.setViewControllers([navone, navsec], animated: true)
    }
    
    
}
    
