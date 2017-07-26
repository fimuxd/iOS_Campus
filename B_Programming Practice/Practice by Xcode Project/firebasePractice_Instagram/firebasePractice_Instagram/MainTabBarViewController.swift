//
//  MainTabBarViewController.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 25/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

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
        let vc5Navi = UINavigationController(rootViewController: viewController5)
        
        viewController5.view.backgroundColor = .black
        viewController5.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        viewController5.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        viewController5.tabBarItem.title = "Profile"
        
        viewControllers = [viewController1, viewController2, viewController3, viewController4, vc5Navi]
    }
    
    func showLogInVC() {
        let loginVC:LogInViewController = LogInViewController()
        let navigation:UINavigationController = UINavigationController(rootViewController: loginVC)
        self.present(navigation, animated: true, completion: nil)
    }
    
    
    /********************************************/
    //                LifeCycle                 //
    /********************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //autoLogin
        //>진행
        //>로그인 화면 present
        
        //currentUser라는 애는 로그인을 하면 캐쉬로 남아있다. 폰이 꺼져도 로그아웃 하지 않는 이상 남아있다.
        //보통은 이 방식 보다는 토큰을 이용한다. 토큰을 기기에 가지고 있다가 서버가 토큰이 유효한지 아닌지 확인해서 처리한다.
        if !DataCenter.sharedData.requestIsLogin(){
            DispatchQueue.main.async {
                self.showLogInVC()
            }
        }
        
        
        setSubViewController()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
