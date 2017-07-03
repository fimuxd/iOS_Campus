//
//  MyAnnotation.swift
//  Test
//
//  Created by Bo-Young PARK on 30/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate:CLLocationCoordinate2D, title:String, subtitle:String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
