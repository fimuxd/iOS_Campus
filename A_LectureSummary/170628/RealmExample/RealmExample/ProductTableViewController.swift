//
//  ProductTableViewController.swift
//
//  Created by giftbot on 2017. 1. 11..
//  Copyright © 2017년 giftbot. All rights reserved.
//

import UIKit
import SafariServices

final class ProductTableViewController: UITableViewController{
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ProductTableViewCell
    
    let product = productList[indexPath.row]
    cell.productCode = product.code
    cell.productName.text = product.name
    cell.productPrice.text = product.price
    cell.imageView?.image = UIImage.init(named: product.name)
    cell.delegate = self
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let baseURL = "https://en.wikipedia.org/wiki/"
    let url = URL(string: baseURL + productList[indexPath.row].name)!
    
    let safariVC = SFSafariViewController(url: url)
    safariVC.navigationItem.title = productList[indexPath.row].name
    self.navigationController?.pushViewController(safariVC, animated: true)
    
  }
}

extension ProductTableViewController: ProductTableViewCellDelegate  {
  func addProductToCart(code: String, name: String) {
    CartItemManager.shared.addItem(code: code, name: name)
  }
}

