//: Playground - noun: a place where people can play

import UIKit


import Foundation

struct Album {
    
    var title:String
    var artist:String
    var genre:String
    var songs:[Song] = []
    
    
    //딕셔너리 -> 인스턴스: 딕셔너리를 가지고 인스턴스를 만드는 역할
    init(data:[String:Any]) {
        title = data["album_title"] as? ?? "무제"
        
        var songList = data["song"] as? [[String:Any]] ?? []
        for song in songList {
            songs.append(Song(data:song))
        }
    
    }
    
    //인스턴스 -> 딕셔너리: 인스턴스를 딕셔너리로 만들어주는 역할
    var dic:[String:Any] {
        var returnDic:[String:Any] = [:]
        returnDic.updateValue(title,, forKey: "album_title")
        
        return return Dic
    }
}

struct Song {
    
    init(data:[String:Any]) {
        
    }
}


class DataFile {
    
    func load() -> Album {
        
        // 여기서 path를 통해서 파일을 가져오는 과정이 있다.
        
        let dic = NSDictionary(contentsOfFile: path) as! [String:Any]
        return Album(data: dic)
        
    }
    
    func save(data:Album) {
        
        
        // 여기서 path를 통해서 파일을 가져오는 과정이 있다.
        
        var dictionary = NSDictionary(dictionary: data.dic)
        dictionary.write(toFile: path, atomically: true)
    }
    

}