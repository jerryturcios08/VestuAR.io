//
//  VTTabBarController.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class VTTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray

        viewControllers = [
            createClosetNavigation(),
            createSizingNavigation(),
            createProfileNavigation()
        ]
    }

    private func createClosetNavigation() -> UINavigationController {
        let closetScreen = ClosetScreen()
        closetScreen.title = "Closet"

        closetScreen.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        return VTNavigationController(rootViewController: closetScreen)
    }

    private func createSizingNavigation() -> UINavigationController {
        let sizingScreen = SizingScreen()
        sizingScreen.title = "Sizing"

        sizingScreen.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "ruler"),
            selectedImage: UIImage(systemName: "ruler.fill")
        )

        return VTNavigationController(rootViewController: sizingScreen)
    }

    private func createProfileNavigation() -> UINavigationController {
        let profileScreen = ProfileScreen()
        profileScreen.title = "Profile"

        profileScreen.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )

        return VTNavigationController(rootViewController: profileScreen)
    }
}
