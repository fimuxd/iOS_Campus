//
//  ShoppingCartViewController.swift
//
//  Created by giftbot on 2017. 1. 11..
//  Copyright © 2017년 giftbot. All rights reserved.
//

import UIKit

final class ShoppingCartViewController: UIViewController {
  var itemList: [CartItemList]!
  @IBOutlet weak var ShoppingCartTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    itemList = CartItemManager.shared.getItemListInCart()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    itemList = CartItemManager.shared.getItemListInCart()
    self.ShoppingCartTableView.reloadData()
  }
}

extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ShoppingCartTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! ShoppingCartTableViewCell
    
    let item = itemList[indexPath.row]
    
    cell.productCode = item.code
    cell.productNameLabel?.text = item.name
    cell.productAmountLabel.text = "\(item.amount) 개"
    cell.productAmountChangeStepper.value = Double(item.amount)
    cell.delegate = self
    
    return cell
  }
}

extension ShoppingCartViewController: ShoppingCartTableViewCellDelegate {
  func changeItemAmount(code: String, amount: Int, cell: ShoppingCartTableViewCell) {
    CartItemManager.shared.changeItemAmountInCart(code: code, amount: amount)
    
    let indexPath: IndexPath = self.ShoppingCartTableView.indexPath(for: cell)!
    
    if amount == 0 {
      itemList.remove(at: indexPath.row)
      self.ShoppingCartTableView.deleteRows(at: [indexPath], with: .automatic)
    } else {
      self.ShoppingCartTableView.reloadRows(at: [indexPath], with: .automatic)
    }
  }
}
