//
//  CustomVendingMachineView.swift
//  UICustomViewPractice
//
//  Created by Bo-Young PARK on 12/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

protocol CustomVendingMachineViewDelegate {
    func didSelectedItem(item:CustomVendingMachineView)
    
    func isAbleToTouch() -> Bool
}

class CustomVendingMachineView: UIView {
    
    var delegate:CustomVendingMachineViewDelegate?
    
    @IBOutlet var productImage:UIImageView?
    @IBOutlet var titleLabel:UILabel?
    @IBOutlet var itemTappedBtn:UIButton?
    @IBAction func itemTappedBtn(_ sender: UIButton) {
        //        print("초코우유")
        showCurrentStatus()
        delegate?.didSelectedItem(item: self)
    }
    
    @IBAction func btnAction(_sender:UIButton) {
        if delegate?.isAbleToTouch() ?? false {
            delegate?.didSelectedItem(item: self)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.brown.cgColor
        self.layer.cornerRadius = self.frame.width/2
        self.layer.borderWidth = 1
        self.productImage?.image = UIImage(named: "ChocoMilk")
        self.titleLabel?.backgroundColor = .brown
        self.titleLabel?.text = "초코우유"
        self.titleLabel?.textColor = .lightGray
    }
    
    func showCurrentStatus() {
        if self.backgroundColor == .white {
            self.titleLabel?.text = "초코우유 받으세요"
            self.backgroundColor = .brown
        }else {
            self.titleLabel?.text = "초코우유"
            self.backgroundColor = .white
        }
    }

}
