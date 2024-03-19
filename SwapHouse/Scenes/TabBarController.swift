//
//  TabBarController.swift
//  SwapHouse
//
//  Created by Cansu Özdizlekli on 3/19/24.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.backgroundColor = .primaryWhite
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        additionalSafeAreaInsets.bottom = 6
        tabBar.tintColor = .blue
        tabBar.addShadow(shadowColor: .gray, offSet: CGSize.zero, opacity: 0.2, shadowRadius: 3, cornerRadius: 15, corners: [.topLeft,.topRight])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        let homeTabItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       selectedImage: UIImage(systemName: "house.fill"))
        homeTab.tabBarItem = homeTabItem
        
        let settingsTab = SettingsViewController()
        let settingsTabItem = UITabBarItem(title: "Settings",
                                       image: UIImage(systemName: "person"),
                                       selectedImage: UIImage(systemName: "person.fill"))
        settingsTab.tabBarItem = settingsTabItem
        
//        let startedTab = ProfileVC()
//        let startedTabItem = UITabBarItem(title: "Profile",
//                                       image: UIImage(systemName: "crown"),
//                                       selectedImage: UIImage(systemName: "crown.fill"))
//        startedTab.tabBarItem = startedTabItem
//        
        self.viewControllers = [homeTab,settingsTab]
    }
    
    
    
    
    
    
    
}
