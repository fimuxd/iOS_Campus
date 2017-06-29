//
//  SwitchCell.swift
//  PairProgrammingSettingView
//
//  Created by 박종찬 on 2017. 6. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class SwitchCell: YMTableViewCell {
    
    @IBOutlet var switcher:UISwitch!

    var switcherVallue:Bool = true{
        willSet{
            if let data = cellData {
                UserDefaults.standard.set(newValue, forKey: data.title)
            }

        }
    }
    
    override var cellData:CellData?{
        get{
            return super.cellData
        }
        set{
            super.cellData = newValue
            switcherVallue = UserDefaults.standard.bool(forKey: newValue!.title)
            switcher.isOn = switcherVallue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    @IBAction func valueChangedSwitch(_ sender:UISwitch)
    {
        switcherVallue = sender.isOn
        if let key = cellData?.postKey {
            NotificationCenter.default.post(name: Notification.Name(rawValue:key), object: cellData, userInfo: ["value":switcherVallue])
        }

    }
 
//    func set(switchValue:Bool)
//    {
//        switcher.isOn = switchValue
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.cellSwitch.isOn = UserDefaults.standard.bool(forKey: (self.textLabel?.text)!)
    }
    

}
