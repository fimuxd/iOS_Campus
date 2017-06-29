//
//  AppDelegate.swift
//  LifeCycle
//
//  Created by 박종찬 on 2017. 6. 8..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Tells the delegate that the launch process is almost done and the app is almost ready to run.
        // 앱딜리게이트에게 실행 프로세스가 거의 완료되었으며, 앱이 실행될 준비를 마쳤다고 알려줍니다.
        print("didFinishLaunchingWithOptions    앱이 옵션과 함께 런치되었습니다.")
        print("---------------------------------------------------------------------")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("applicationWillResignActive      앱이 액티브 상태에서 물러났습니다.")
        print("---------------------------------------------------------------------")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("applicationDidEnterBackground    앱이 백그라운드로 들어갔습니다.")
        print("---------------------------------------------------------------------")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("applicationWillEnterForeground   앱이 포어그라운드(앞)으로 나오기 직전입니다.")
        print("---------------------------------------------------------------------")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("applicationDidBecomeActive       앱이 액티브 상태가 되었습니다.")
        print("---------------------------------------------------------------------")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("applicationWillTerminate         앱이 꺼질 것입니다.")
        print("---------------------------------------------------------------------")
    }


}

