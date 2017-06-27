//
//  DataFile.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation


/******************************************/
//               Struct 영역                //
/******************************************/

//전체적인 plist의 모습: 파일자체어레이[ 섹션나타내는어레이[ 이름,성별,나이딕셔너리[ String:Any]]]
struct TableData {
    var sections:[SectionData] = []
    
    init(datas:[Any]) {
        for data:Any in datas {
            sections.append(SectionData(datas: data as! [Any]))
        }
    }
}

struct SectionData {
    var rows:[CellData] = []
    
    init(datas:[Any]) {
        for data:Any in datas {
            rows.append(CellData(data: data as! [String : Any]))
        }
    }
}

struct CellData {
    var title:String
    var subTitle:Int
    var gender:Gender
    
    init(data:[String:Any]) {
        title = data["name"] as? String ?? "이름 없음"
        subTitle = data["age"] as? Int ?? 0
        
        if let genderStr = data["gender"] {
            gender = .Man
        }else{
            gender = .Woman
        }
        
        
    }
    
}



class DataFile {
    
    /******************************************/
    //                Initialize              //
    /******************************************/
    
    static let sharedSetting:DataFile = DataFile()
    
    init() {
        loadSettingData()
    }
    
    func friendListSave() {
        saveSettingData()
    }
    
    deinit {
        saveSettingData()
    }
    
    /******************************************/
    //           Private Propertise           //
    /******************************************/
    var settingData:TableData?
    
    
    /******************************************/
    //            DataLoad | Save             //
    /******************************************/
    private func loadSettingData() {
        if let path = Bundle.main.path(forResource: "FriendsData", ofType: "plist"),
            let dataList = NSArray(contentsOfFile: path) as? [[Any]] {
            settingData = TableData(datas: dataList)
        }
    }
    
    private func saveSettingData() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        let realPath = path[0] + "/FriendsData.plist"
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: realPath) {
            if let bundlePath = Bundle.main.path(forResource: "FriendsList", ofType: "plist") {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
                }catch{
                    return
                }
            }else{
                return
            }
            
        }
        
        guare let _ = dataFile else {
            return
        }
        
        let nsArray = NSArray(array)
        
        
        
        
    }
    
}









}
