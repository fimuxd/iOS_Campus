//
//  SongMetaData.swift
//  MusicPlayer
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import AVFoundation
import UIKit

struct SongMetaData {
    var songTitle:String?
    var albumName:String?
    var artistName:String?
    var albumImg:UIImage?
    var songID:Int?
    
    /*
     title
     creationDate
     artwork
     albumName
     artist
     
     */
    
    init(metaData:[AVMetadataItem], id:Int) {
        for item in metaData
        {
            if let key = item.commonKey
            {
             
                switch key {
                case "title":
                   songTitle = item.stringValue
                case "artwork":
                    albumImg = UIImage(data: item.value?.copy(with: nil) as! Data)
                case "albumName":
                    albumName = item.stringValue
                case "artist":
                    artistName = item.stringValue
                
                default:
                    break;
                }
                
            }
        }
        songID = id
    }
    
    
}
