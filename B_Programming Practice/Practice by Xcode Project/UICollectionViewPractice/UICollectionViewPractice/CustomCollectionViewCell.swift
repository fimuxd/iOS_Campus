//
//  CustomCollectionViewCell.swift
//  UICollectionViewPractice
//
//  Created by Bo-Young PARK on 3/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    func set(title:String) {
        self.titleLabel.text = title
    }
    
    func set(image:String) {
        self.mainImage.image = UIImage.init(named: image)
    }
    
    override func awakeFromNib() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .orange
        self.selectedBackgroundView = backgroundView
    }
}
