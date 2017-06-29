//
//  ShoppingCartTableViewCell.swift
//
//  Created by giftbot on 2017. 1. 12..
//  Copyright © 2017년 giftbot. All rights reserved.
//

import UIKit

protocol ShoppingCartTableViewCellDelegate: class {
    func changeItemAmount(code: String, amount: Int, cell: ShoppingCartTableViewCell)
}

class ShoppingCartTableViewCell: UITableViewCell {
    weak var delegate: ShoppingCartTableViewCellDelegate!
    var productCode: String!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productAmountLabel: UILabel!
    @IBOutlet weak var productAmountChangeStepper: UIStepper!
    
    @IBAction func changeProductAmount(_ sender: UIStepper) {
        self.delegate.changeItemAmount(code: productCode, amount: Int(productAmountChangeStepper.value), cell: self)
    }
    
}
