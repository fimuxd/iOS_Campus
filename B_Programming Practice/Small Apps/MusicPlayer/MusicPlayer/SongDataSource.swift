//
//  SongDataSource.swift
//  MusicPlayer
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation

class SongDataSource {
    
    private var songMetaDataArray:[SongMetaData] = []
    
    init() {
        getMetaData()
    }
    
    //연산프로퍼티를 통해 MetaData를 가져옴
    var numberOfItems:Int{
        return songMetaDataArray.count
    }
    
    func cellForSongData(at index:Int) -> SongMetaData? {
        return  songMetaDataArray[index]
    }
    
    func getMetaData()
    {
        
        //보통은 .mp3의 이름은 딕셔너리의 형태로 가지게 되지만, 여기서는 편의상 0-29의 숫자로 설정했다.
        for i in 0..<30
        {
            let count:String = "\(i)"
            
            //AVAsset 자체가 URL로 불러와야 하기 때문에, path가 아닌 URL을 통해 가져오게 된다.
            //따라서 가장 먼저 가져와야할 것은 Asset이다.
            if let fileURL = Bundle.main.url(forResource: count, withExtension: "mp3")
            {
                let asset:AVAsset = AVURLAsset(url: fileURL, options: nil)
                let metaData:[AVMetadataItem] = asset.commonMetadata
                let songData = SongMetaData(metaData: metaData, id: i)
                songMetaDataArray.append(songData)
            }else
            {
                print("file이 없음")
            }
        }
    }
    
    func getSongData(withID id:Int) -> SongMetaData {
        let getDatas = songMetaDataArray.filter { (data) -> Bool in
            data.songID == id
        }
        return getDatas[0]
    }
}
