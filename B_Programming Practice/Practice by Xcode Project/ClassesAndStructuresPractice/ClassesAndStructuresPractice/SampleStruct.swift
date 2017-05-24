//
//  SampleStruct.swift
//  ClassesAndStructuresPractice
//
//  Created by Bo-Young PARK on 24/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

struct Book {
    var name:String
    var cost:Int
    var isbn:UInt
 
}

class BookStore {
    var computerBooks:[Book]
    var name:String
    var address:String
    
    init(computerBooks:[Book], name:String, address:String) {
        self.computerBooks = computerBooks
        self.name = name
        self.address = address
    }
    
//        func addBook(name:String, cost:Int) {
//            let book:Book = Book(name: "스위프트 마스터", cost: 50000, isbn: UInt(computerBooks.count + 1))
//            self.computerBooks.append(book)
//        }
    
}

var number:Int = Int()
