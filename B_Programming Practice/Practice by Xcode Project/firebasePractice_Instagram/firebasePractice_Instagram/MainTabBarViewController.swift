//
//  MainTabBarViewController.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 25/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    /********************************************/
    //                  전역변수                   //
    /********************************************/
    
    
    /********************************************/
    //                  method                   //
    /********************************************/
    func setSubViewController() {
        
        let viewController1 = UIViewController()
        viewController1.view.backgroundColor = .red
        viewController1.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        viewController1.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
        viewController1.tabBarItem.title = "Home"
        
        let viewController2 = UIViewController()
        viewController2.view.backgroundColor = .blue
        viewController2.tabBarItem.image = #imageLiteral(resourceName: "search_unselected")
        viewController2.tabBarItem.selectedImage = #imageLiteral(resourceName: "search_selected")
        viewController2.tabBarItem.title = "Search"
        
        let viewController3 = UIViewController()
        viewController3.view.backgroundColor = .green
        viewController3.tabBarItem.image = #imageLiteral(resourceName: "plus_unselected")
        viewController3.tabBarItem.title = "Plus"
        
        let viewController4 = UIViewController()
        viewController4.tabBarItem.image = #imageLiteral(resourceName: "like_unselected")
        viewController4.tabBarItem.selectedImage = #imageLiteral(resourceName: "like_selected")
        viewController4.tabBarItem.title = "Like"
        
        let layout = UICollectionViewFlowLayout()
        
        let viewController5 = ProfileViewController(collectionViewLayout: layout)
        viewController5.view.backgroundColor = .black
        viewController5.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        viewController5.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        viewController5.tabBarItem.title = "Profile"
        
        viewControllers = [viewController1, viewController2, viewController3, viewController4, viewController5]
    }
    
    
    /********************************************/
    //                LifeCycle                 //
    /********************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        setSubViewController()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
