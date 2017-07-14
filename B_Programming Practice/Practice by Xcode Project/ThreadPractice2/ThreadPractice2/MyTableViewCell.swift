//
//  MyTableViewCell.swift
//  ThreadPractice2
//
//  Created by Bo-Young PARK on 14/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    //******************************************//
    //            IBOutlet | 전역변수              //
    //******************************************//
    @IBOutlet weak var testImageViewOutlet: UIImageView!
    @IBOutlet weak var testIndexTextLabel: UILabel!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //******************************************//
    //            IBAction | 함수영역              //
    //******************************************//
    private func set(title:String) {
        self.testIndexTextLabel.text = title
    }
    
    private func set(image:UIImage) {
        self.testImageViewOutlet.image = image
    }
    
    func set(title:String, imageUrl:String) {
        self.testIndexTextLabel.text = title
        self.indicator.startAnimating()
        
        DispatchQueue.global(qos: .default).async {
            if let url = URL(string: imageUrl) {
                do{
                    let realData = try Data(contentsOf: url)
                    
                    DispatchQueue.main.async {
                        self.set(image: UIImage(data: realData)!)
                        self.indicator.stopAnimating()
                    }
                    print("===loading Image(\(title))===")
                }catch{
                    
                }
            }
        }
        
    }
    
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .blue
        
        self.selectedBackgroundView = backgroundView
        
        self.indicator.color = .blue
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
