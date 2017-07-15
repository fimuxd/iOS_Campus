//
//  Reciept.swift
//  DataCenterPractice(HS)
//
//  Created by Bo-Young PARK on 15/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

struct Recipe {
    let recipeID:Int
    let name:String
    let time:Int
    let cost:Int
    let drink:Drink
    let ingrediants:String
    let detail:String
    let shortDescriptiion:String
    
    var dictionary:[String:Any] {
        get{
            return [Authentification.plist_RecipeID:recipeID,
                    Authentification.plist_Name:name,
                    Authentification.plist_Time:time,
                    Authentification.plist_Cost:cost,
                    Authentification.plist_Drink:drink,
                    Authentification.plist_Ingrediants:ingrediants,
                    Authentification.plist_Detail:detail,
                    Authentification.plist_ShortDecription:shortDescriptiion]
        }
    }
    
    init(with dictionary:[String:Any]) {
        self.recipeID = dictionary[Authentification.plist_RecipeID] as! Int
        self.name = dictionary[Authentification.plist_Name] as! String
        self.time = dictionary[Authentification.plist_Time] as! Int
        self.cost = dictionary[Authentification.plist_Cost] as! Int
        self.drink = Drink(rawValue: dictionary[Authentification.plist_Drink] as! Int)!
        self.ingrediants = dictionary[Authentification.plist_Ingrediants] as! String
        self.detail = dictionary[Authentification.plist_Detail] as! String
        self.shortDescriptiion = dictionary[Authentification.plist_ShortDecription] as! String
    }
    
}


