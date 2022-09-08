//
//  SceneDelegate.swift
//  Domino
//
//  Created by 서은지 on 2022/09/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
       
        let mainVC = DominoViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        let secondVC = WishTableViewController()

        mainVC.navigationItem.title = "Domino`s"
        navigationController.tabBarItem = UITabBarItem(title: "Domino`s", image: UIImage(systemName: "app.fill"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Wish list", image: UIImage(systemName: "app.fill"), tag: 1)


        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController, secondVC]
                
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        
    }
}
