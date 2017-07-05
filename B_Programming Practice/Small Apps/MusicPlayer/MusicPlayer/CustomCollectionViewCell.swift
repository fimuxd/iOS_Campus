//
//  CustomCollectionViewCell.swift
//  MusicPlayer
//
//  Created by Bo-Young PARK on 4/7/2017.
//  Copyright © 2017 WingsCompany. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumCoverImage: UIImageView!
    
    private var data:SongMetaData?
    var songData:SongMetaData? {
        return data
    }
    
    
    func setSongData(_ songData:SongMetaData) {
        data = songData
        
        if let title:String = songData.songTitle {
            titleLabel.text = title
        }
        
        if let image:UIImage = songData.albumImg {
            albumCoverImage.image = image
        }
    }
}
