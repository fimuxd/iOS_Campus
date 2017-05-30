//
//  AppDelegate.swift
//  UserDefaults
//
//  Created by Bo-Young PARK on 30/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // ViewController를 Code로 불러와서 띄운다. 왜냐하면 AppDelegate의 didFinishLaunchingWithOptions가 App이 런칭만 되면 실행되는 놈이기 때문에
        
        // 1. window를 하나 만들어준다
            self.window = UIWindow(frame: UIScreen.main.bounds)

//        // 2-1. storyboard를 만들어 연결시켜준다. 여기서 withIdentifier에 입력해준 값이 storyboard의 ID값이 되므로, 해당 값(여기서는 ViewController)를 Main.storyboard로 가서 동일한 ID값을 입력시켜 주어야 한다.
//        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController:ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        
          // 2-2. 새로 만든 MainViewController라는 놈을 첫 화면으로 띄우려면?
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController:MainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! ViewController

//
//        // 3-1. 2번에서 생성한 viewController라는 VC를 창의 rootView로 설정한다.
//        self.window?.rootViewController = viewController
//        self.window?.makeKeyAndVisible()
        
        // 3-2. MainViewController 를 rootView로 설정한다
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
        
       
        
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

