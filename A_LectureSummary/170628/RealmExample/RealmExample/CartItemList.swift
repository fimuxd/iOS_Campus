//
//  CartItemList.swift
//
//  Created by giftbot on 2017. 1. 11..
//  Copyright © 2017년 giftbot. All rights reserved.
//

import Foundation
import RealmSwift

class CartItemList: Object {
  dynamic var code: String = ""
  dynamic var name: String = ""
  dynamic var amount: Int = 0
  
  override static func primaryKey() -> String? {
    return "code"
  }
}

final class CartItemManager {
  static let shared = CartItemManager()
  private init() { }
  
  let realm = try! Realm()
  
  func addItem(code: String, name: String) {
    let itemInCart = realm.objects(CartItemList.self).filter("code = %@", code)
    
    do  {
      try realm.write {
        if let item = itemInCart.first {
          item.amount += 1
        } else {
          realm.create(CartItemList.self, value: ["code": code, "name": name, "amount": 1], update: true)
        }
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func changeItemAmountInCart(code: String, amount: Int) {
    let itemInCart = realm.objects(CartItemList.self).filter("code = %@", code)
    let item = itemInCart.first!
    
    do {
      try realm.write {
        if amount == 0 {
          realm.delete(itemInCart)
        } else {
          item.amount = amount
        }
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func getItemListInCart() -> [CartItemList] {
    let items = realm.objects(CartItemList.self).sorted(byKeyPath: "code")
    return Array(items)
  }
}
