//
//  YMTableViewCell.swift
//  PairProgrammingSettingView
//
//  Created by youngmin joo on 2017. 6. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class YMTableViewCell: UITableViewCell {

    
    @IBOutlet var titleLb:UILabel!
    @IBOutlet var detailLb:UILabel?
    
    var indexPaht:IndexPath?
    var type:CellType?
    private var data:CellData?
    
    var cellData:CellData?{
        get{
            return data
        }
        set{
            data = newValue
            titleLb.text = data?.title
            detailLb?.text = data?.subText ?? ""
            type = data?.type
            
            if let key = cellData?.notiKey {
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(YMTableViewCell.callNoti(_:)),
                                                       name: Notification.Name(rawValue:key) , object: nil)
            }else
            {
                NotificationCenter.default.removeObserver(self)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
//    func callNot(_ noti:Notification)
//    {
//        if let notiData = noti.object as? CellData,
//            let switchValue = noti.userInfo?["value"] as? Bool
//        {
//            if switchValue
//            {
//                detailLb?.text = notiData.title
//                self.isUserInteractionEnabled = false
//            }else
//            {
//                detailLb?.text = ""
//                self.isUserInteractionEnabled = true
//            }
//        }
//    }
    
    func callNoti(_ noti:Notification) {
        if let notiData = noti.object as? CellData,
            let swtichValue = noti.userInfo?["value"] as? Bool {
            
            switch notiData.notiName {
            case .Airplay:
                actionNotiAirplay(data: notiData.title, switchValue: swtichValue)
            case .Wifi:
                actionWifi(switchValue: swtichValue)
            case .None:
                print("error")
            }
        }
    }
    
    
    func actionNotiAirplay(data:String, switchValue:Bool) {
        if switchValue {
            detailLb?.text = data
            self.isUserInteractionEnabled = !switchValue
        }else{
            detailLb?.text = ""
            self.isUserInteractionEnabled = !switchValue
        }
    }
    
    func actionWifi(switchValue:Bool) {
        if switchValue {
            detailLb?.text = "켜짐"
        }else{
            detailLb?.text = "꺼짐"
        }
    }
    
    func set(title:String)
    {
        titleLb.text = title
    }
    

    func set(subText:String) {
        if let lb = detailLb {
            lb.text = subText
        }
    }
}
