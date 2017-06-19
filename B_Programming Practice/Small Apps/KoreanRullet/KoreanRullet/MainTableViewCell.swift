//
//  MainTableViewCell.swift
//  KoreanRullet
//
//  Created by Bo-Young PARK on 15/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

protocol MainTableViewCellDelegate {
    func didTextFieldOnCellEditing(inputNameText:String, tableViewCell:MainTableViewCell)
}


class MainTableViewCell: UITableViewCell, UITextFieldDelegate {

    var indexPath:IndexPath?
    var delegate:MainTableViewCellDelegate?
    
    //****************************************//
    //               IBOutlet                 //
    //****************************************//
    
    @IBOutlet weak var inputMemberNameTextField: UITextField!
    
    
    //****************************************//
    //          UITextField Delegate          //
    //****************************************//
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
         delegate?.didTextFieldOnCellEditing(inputNameText: textField.text!, tableViewCell: self)
    }
    
    
    

    //****************************************//
    //              LifeCycle                 //
    //****************************************//
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
