//
//  AppDelegate.swift
//  QuoteDev
//
//  Created by leejaesung on 2017. 7. 6..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import  UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 허용 여부 - 호출부분
        let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        
        application.registerUserNotificationSettings(setting)
        
        
        if let localNoti = launchOptions?[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification {
            
            
            let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = sb.instantiateViewController(withIdentifier: "vc")
            
            application.keyWindow?.rootViewController = vc
            
        }
        
        
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        let setting = application.currentUserNotificationSettings
        guard setting?.types != .none else {
            print("Can't schedule")
            return
        }
        
        let nContent = UNMutableNotificationContent()
        
        nContent.badge = 1
        nContent.title = "읽어봐(Var)"
        nContent.body = "한줄 코드라도 서로 거들면 낫다."
        nContent.subtitle = "오늘의 명언"
        nContent.sound = UNNotificationSound.default()
        
        
        let hourKeyString = UserDefaults.standard.string(forKey: "notiHour")
        let minuteKeyString = UserDefaults.standard.string(forKey: "notiMinute")
        var date = DateComponents()
        date.hour = Int(hourKeyString ?? "08")
        date.minute = Int(minuteKeyString ??  "00")
        
        if hourKeyString != nil {
            print("nil 아님")
            date.hour = Int(hourKeyString!)
            date.minute = Int(minuteKeyString!)
        }else{
            print("nil")
            date.hour = 08
            date.minute = 00
            UserDefaults.standard.set("08", forKey: "notiHour")
            UserDefaults.standard.set("00", forKey: "notiMinute")
            
        }
        
        // 특정시간 반복
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let request = UNNotificationRequest(identifier: "WakeUp", content: nContent, trigger: calendarTrigger)
        UNUserNotificationCenter.current().add(request)
        
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

