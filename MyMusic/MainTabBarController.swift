//
//  MainTabBarController.swift
//  MyMusic
//
//  Created by Max Pavlov on 28.05.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()

        tabBar.tintColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        viewControllers = [generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "search"), title: "Search"), generateViewController(rootViewController: ViewController(), image: #imageLiteral(resourceName: "library"), title: "Library")]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}
