//
//  Product.swift
//
//  Created by giftbot on 2017. 1. 12..
//  Copyright © 2017년 giftbot. All rights reserved.
//

import Foundation

class Product {
    var code : String!
    var name : String!
    var price : String!
    
    init(code: String, name: String, price: String) {
        self.code  = code
        self.name  = name
        self.price = price
    }
}

let productList = [
    Product(code: "B001", name: "Baseball", price: "100"),
    Product(code: "B002", name: "Basketball", price: "200"),
    Product(code: "B003", name: "Football", price: "300"),
    Product(code: "B004", name: "Golf", price: "400"),
    Product(code: "B005", name: "Rugby", price: "500"),
    Product(code: "B006", name: "Tennis", price: "600"),
    Product(code: "B007", name: "Volleyball", price: "700"),
    Product(code: "B008", name: "TableTennis", price: "800"),
    Product(code: "B009", name: "IceHockey", price: "900"),
    Product(code: "B010", name: "Billiard", price: "1000"),
    Product(code: "B011", name: "Shuttlecock", price: "1100"),
]
