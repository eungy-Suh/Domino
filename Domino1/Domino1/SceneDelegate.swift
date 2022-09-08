//
//  SceneDelegate.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/07.
//

import UIKit


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
       
        let mainVC = DominoViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        mainVC.navigationItem.title = "Domino`s"

        let secondVC = WishTableViewController()
        let navigationController2 = UINavigationController(rootViewController: secondVC)
        secondVC.navigationItem.title = "1234"

        navigationController.tabBarItem = UITabBarItem(title: "Domino`s", image: UIImage(systemName: "app.fill"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Wish list", image: UIImage(systemName: "app.fill"), tag: 1)


        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController, navigationController2]
                
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        
    }
}
