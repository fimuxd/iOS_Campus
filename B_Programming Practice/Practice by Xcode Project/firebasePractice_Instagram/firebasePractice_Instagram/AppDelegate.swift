//
//  AppDelegate.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 24/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //지금부터 저희는 모든 UI를 다 코드로 쓸겁니다.
        
        //Google Firebase 설치
        FirebaseApp.configure()
        
        //1. 윈도우를 만드는데, 스크린에서 frame을 가져온다.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //2. 루트 VC를 만든다.
        //        let rootVC = UIViewController()
        //        rootVC.view.backgroundColor = UIColor.blue
//        let rootVC = LogInViewController()
//        rootVC.view.backgroundColor = .white
//        
//        window?.rootViewController = rootVC
//        window?.makeKeyAndVisible() //makeKeyAndVisible: 윈도우에 루트뷰를 설정한다음에 다시 리셋시키는 기능을 한다.
     
        
//        //네비게이션 추가
//        let rootNavi = UINavigationController(rootViewController: LogInViewController())
//        
//        window?.rootViewController = rootNavi
//        window?.makeKeyAndVisible()

        //mainTabBar설치
        window?.rootViewController = MainTabBarViewController()
        window?.makeKeyAndVisible()
        window?.tintColor = .black
        
        
        
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

