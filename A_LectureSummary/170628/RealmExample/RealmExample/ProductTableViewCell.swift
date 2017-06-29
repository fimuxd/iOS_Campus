//
//  ProductTableViewCell.swift
//
//  Created by giftbot on 2017. 1. 12..
//  Copyright © 2017년 giftbot. All rights reserved.
//

import UIKit

protocol ProductTableViewCellDelegate : class {
  func addProductToCart(code: String, name: String)
}

class ProductTableViewCell: UITableViewCell {
  weak var delegate: ProductTableViewCellDelegate!
  var productCode: String!
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var productPrice: UILabel!
  
  @IBAction func addProduct(_ sender: UIButton) {
    self.delegate.addProductToCart(code: productCode, name: productName.text!)
  }
}
