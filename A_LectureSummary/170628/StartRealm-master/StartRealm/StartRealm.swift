//
//  StartRealm.swift
//  StartRealm
//
//  Created by Mijeong Jeon on 20/03/2017.
//  Copyright © 2017 Jo Seong Gyu. All rights reserved.
//

import Foundation
import RealmSwift

// Album Model
class Album: Object {
    dynamic var title: String = ""
    dynamic var createDate: Date = Date()
    let photos: List<Photo> = List<Photo>()
}

// Photo Model
class Photo: Object {
    dynamic var createDate: Date = Date()
    dynamic var image: Data = Data()
}
