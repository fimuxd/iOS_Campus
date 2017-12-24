//
//  SettingViewController.swift
//  QuoteVarSetting
//
//  Created by HwangGisu on 2017. 7. 6..
//  Copyright © 2017년 HwangGisu. All rights reserved.
//

import UIKit
import UserNotifications
//
//// Temp Data
//var settingTempData: [[String:Any]] = [[:]]
//var dicData: [[String:Any]] = [["sectionTitle":"노티","data":["title":"시간설정", "timer":"0"]],
//                               ["sectionTitle":"앱소개","data":[["title":"개발자소개", "info":"개발자이름"],
//                                                                   ["title":"버전", "info":"v1.0"],
//                                                                   ["title":"개발자 문의하기", "info":"email주소"]
//                                ]]
//]

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var settingMainTableView: UITableView!
    
    @IBOutlet weak var timerView: TimerView!
    
    @IBOutlet var timerDatePickerOutlet:UIDatePicker!
    
    var originFrame = CGRect()
    var reverseFrame = CGRect()
    var titleTemp = ["개발자 소개","버전", "개발자 문의하기"]
    var messageTemp = ["by 이재성A, 이재성B, 황기수","1.0","fastcampus@fast.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingMainTableView.dataSource = self
        settingMainTableView.delegate = self
        
        timerView.isHidden = true
        originFrame = self.timerView.frame
        reverseFrame = self.timerView.frame
        reverseFrame.origin.y += 421
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: 섹션 타이틀 설정.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Notification Timer Setting"
        case 1:
            return "Application Setting"
        default:
            return "-"
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 //dicData.count //section 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        var dataCount = dicData[section]
        //        var datInfo = dataCount["data"] as? [Any] ?? []
        //        print("dic", dataCount)
        var sectionRowCount = 0
        
        if section == 0 {
            sectionRowCount = 1
            
        }else{
            sectionRowCount = 3
        }
        
        return sectionRowCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        var data = dicData[indexPath.section]
        //        // 섹션별 셀 처리
        //        let sectionTitle = data["sectionTitle"] as? String ?? ""
        //        print("sectionTitle", sectionTitle)
        //        var settingCell: UITableViewCell = UITableViewCell()
        //
        //        if sectionTitle == "노티" {
        //            settingCell = tableView.dequeueReusableCell(withIdentifier: "NotiTimerCell", for: indexPath) as! NotiTimerTableViewCell
        //
        //        }else{
        //            settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        //
        //        }
        
        if indexPath.section == 0 {
            let notiCell = tableView.dequeueReusableCell(withIdentifier: "NotiTimerCell", for: indexPath)
            notiCell.textLabel?.text = "시간 설정"
            let hour = UserDefaults.standard.string(forKey: "notiHour")
            let minute = UserDefaults.standard.string(forKey: "notiMinute")
            guard let hh = hour, let mm = minute else {
                notiCell.detailTextLabel?.text = "08:00"
                return notiCell
            }
            notiCell.detailTextLabel?.text = "\(hh):\(mm)"
            
            return notiCell
            
        }else {
            let settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
            
            settingCell.textLabel?.text = titleTemp[indexPath.row]
            return settingCell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let originFrame = self.timerView.frame
        if indexPath.section == 0 {
            self.timerView.isHidden = false
            //            UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
            //                self.timerView.alpha = 10
            //                self.timerView.isHidden = false
            //            }) { (_) in
            //                print("완료")
            //            }
            var newFrame = reverseFrame
            print(newFrame)
            //        newFrame.origin.x += 200
            newFrame.origin.y -= 421
            self.timerView.frame = reverseFrame
            
            UIView.animate(withDuration: 1.5,
                           delay: 0,
//                           usingSpringWithDamping: 0.2,
//                           initialSpringVelocity: 0.1,
                           options: [.curveLinear],
                           animations: {
                                self.timerView.frame = newFrame
                                print(newFrame)
                                //self.timerView.isHidden = false
                                //self.timerView.isHidden = true
            }) { (isEnd) in  // delay 후에 일어날 행동???
//                self.timerView.isHidden = false
                self.timerView.frame = self.originFrame
            }
        }else{
            //timerView.isHidden = true
            var newFrame = originFrame
            //        newFrame.origin.x += 200
            newFrame.origin.y += 421
            
            
            UIView.animate(withDuration: 1, delay: 0.5, options: [.curveLinear], animations: {
                self.timerView.frame = newFrame
                //self.timerView.isHidden = true
            }) { (isEnd) in  // delay 후에 일어날 행동???
                self.timerView.isHidden = true
                self.timerView.frame = self.originFrame
                
                let alert = UIAlertController(title: self.titleTemp[indexPath.row], message: self.messageTemp[indexPath.row], preferredStyle: .actionSheet)
                // tableView.deselectRow(at: indexPath, animated: true)
                
                let ok = UIAlertAction(title: "확인", style: .default)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
            //            UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
            //                self.timerView.alpha = 10
            //                self.timerView.isHidden = true
            //            }) { (_) in
            //                print("완료")
            //            }
            
//            let alertController = UIAlertController(nibName: "CollectionCell", bundle: nil)
            
            
        }
        self.settingMainTableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    @IBAction func buttonComplete(_ sender:UIButton) {
        print(self.timerDatePickerOutlet.date.timeIntervalSinceNow)
        UserDefaults.standard.set(self.timerDatePickerOutlet.date.timeIntervalSinceNow, forKey: "notiTime")
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        
        let date = self.timerDatePickerOutlet.date
        let settingDate = dateFormatter.string(from: date)
        print("___________", settingDate)
        
        let notiTime = settingDate
        let timeArr = notiTime.characters.split(separator:":").map{ String($0) }//.map{ Int($0)}
        // Noti설정 시간 설정
        UserDefaults.standard.set(timeArr[0], forKey: "notiHour")
        UserDefaults.standard.set(timeArr[1], forKey: "notiMinute")
        
        
        print("user default value: ", UserDefaults.standard.integer(forKey: "notiHour"))
        
        let setting = UIApplication.shared.currentUserNotificationSettings
        
        guard setting?.types != .none else {
            let alert = UIAlertController(title: "알림 등록", message: "알림이 허용되어 있지 않습니다", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
//                , handler: { (alert) in
//                
//                
//                dateFormatter.dateFormat = "a h시 m분"
//                dateFormatter.locale = Locale(identifier: "ko_KR")
//                //self.dateFormatter.locale = Locale.current
//                
//                print(dateFormatter.string(from: self.timerDatePickerOutlet.date))
//            })

            
            alert.addAction(ok)
            
            self.present(alert, animated: false)
            
            return
        }
        
        //보영: iOS 10.0 이상이라면 실행해
        if #available(iOS 10.0, *) {
            
            let nContent = UNMutableNotificationContent()
            
            //nContent.body = (self.msg.text)!
            nContent.title = "미리 알림"
            nContent.sound = UNNotificationSound.default()
            
            let time = self.timerDatePickerOutlet.date.timeIntervalSinceNow
            print("time", time)
            
            //
            let hourKeyString = UserDefaults.standard.string(forKey: "notiHour")
            let minuteKeyString = UserDefaults.standard.string(forKey: "notiMinute")
            var date = DateComponents()
            date.hour = Int(hourKeyString!)
            date.minute = Int(minuteKeyString!)
            
//            print("datatdatatatatat,   ", date)
           // let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
            let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
            //        let request = UNNotificationRequest(identifier: "WakeUp", content: nContent, trigger: trigger)
            
            let request = UNNotificationRequest(identifier: "WakeUp", content: nContent, trigger: calendarTrigger)
            
            UNUserNotificationCenter.current().add(request) {
                (_) in
                
                // Alert 보여지는 부분 - 수정 필요함
//                var dateFormatter: DateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "HH:mm"
                
//                let date = self.timerDatePickerOutlet.date.addingTimeInterval(9*60*60)
//                print(dateFormatter.string(from: date))
                //
                
                let message = "알림이 등록되었습니다., 등록된 알림은 매일 \(hourKeyString!):\(minuteKeyString!) 마다 알림이 옵니다."
                
                let alert = UIAlertController(title: "알림 등록", message: message, preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "확인", style: .default, handler: { (_) in
                    self.settingMainTableView.reloadData()
                })

                alert.addAction(ok)
                self.present(alert, animated: false)
            }
            
        }else {
            return
        }
        
    }

    
}

///*
// "abcde"[0] === "a"
// "abcde"[0...2] === "abc"
// "abcde"[2..<4] === "cd"
// */
//extension String {
//    
//    subscript (i: Int) -> Character {
//        return self[self.startIndex.advancedBy(i)]
//    }
//    
//    subscript (i: Int) -> String {
//        return String(self[i] as Character)
//    }
//    
//    subscript (r: Range<Int>) -> String {
//        let start = startIndex.advancedBy(r.startIndex)
//        let end = start.advancedBy(r.endIndex - r.startIndex)
//        return self[Range(start ..< end)]
//    }
//}



