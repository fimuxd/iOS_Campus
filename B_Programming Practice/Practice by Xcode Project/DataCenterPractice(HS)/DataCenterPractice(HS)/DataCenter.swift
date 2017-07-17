//
//  DataCenter.swift
//  DataCenterPractice(HS)
//
//  Created by Bo-Young PARK on 15/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class DataCenter {
    static let shared:DataCenter = DataCenter()
    
    private var recipeArray:[Recipe]!
    
    var recipeList:[Recipe] {
        get {
            return recipeArray
        }
    }
    
    private init() {
        loadFromBundle()
    }
    
    
    private func loadFromBundle() {
        let bundlePath:String = Bundle.main.path(forResource: Authentification.plistName, ofType: Authentification.fileType)!
        
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:Any]] {
            parseRecipe(loadedArray)
        }
    }

    
    // 별도의 parse 함수를 만들지 않고 바로
//    private func loadFromBundle() {
//        if let bundlePath:String = Bundle.main.path(forResource: Authentification.plistName, ofType: Authentification.fileType) {
//            let loadedArray = NSArray.init(contentsOfFile: bundlePath) as! [[String:Any]]
//            
//            self.recipeArray = loadedArray.map({ (dictionary:[String:Any]) -> Recipe in
//                return Recipe.init(with: dictionary)
//            })
//        }
//    }
    
    private func parseRecipe(_ array:[[String:Any]]) {
        self.recipeArray = array.map({ (dictionary:[String:Any]) -> Recipe in
            return Recipe.init(with: dictionary)
        })
    }
    
}


enum Drink:String {
    case beer = "0"
    case wine = "1"
    case soju = "2"
}


struct Authentification {
    
    //-----HSRecipeList.plist key 값
    static let plist_RecipeID:String = "recipeID"
    static let plist_Name:String = "name"
    static let plist_Time:String = "time"
    static let plist_Cost:String = "cost"
    static let plist_Drink:String = "drink"
    static let plist_Ingrediants:String = "ingrediants"
    static let plist_Detail:String = "detail"
    static let plist_ShortDecription:String = "shortDescription"
    
    //-----plist FileName & Type
    static let plistName:String = "HSRecipeList"
    static let fileType:String = "plist"
}
