//
//  CustomCollectionViewCell.swift
//  NagMaker
//
//  Created by HyunJomi on 2017. 7. 6..
//  Copyright © 2017년 HyunJung. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        
        
    }
    
    func set(title: String, imageUrl: String)  {
        locationImageView.image = UIImage(named: imageUrl)
        locationLabel.text = title
    }
}
