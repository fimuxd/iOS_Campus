//
//  SettingSwitchCell.swift
//  LogInCoverPractice
//
//  Created by Bo-Young PARK on 20/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit


//Setting TableView상, Switch 있는 Custom Cell 설정 부분

class SettingSwitchCell: UITableViewCell {
    
    //******************************************//
    //              IBOutlet / 전역변수            //
    //******************************************//
   
    @IBOutlet weak var settingSwitcherOutlet: UISwitch!
    @IBOutlet weak var settingTitleLabel: UILabel!
    
    var delegate:SettingSwitchCellDelegate?
    
    
    //******************************************//
    //              IBAction / 함수               //
    //******************************************//
    
    @IBAction func settingSwitcher(_ sender: UISwitch) {
        delegate?.switchCellValueChanged(self, isOn: sender.isOn)

    }
    
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

//Switch가 작동했을 때 main VC에 알려주기 위한 delegate 
protocol SettingSwitchCellDelegate {
    func switchCellValueChanged(_ cell:SettingSwitchCell, isOn:Bool)
}
