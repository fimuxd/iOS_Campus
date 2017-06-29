//
//  SettingCenter.swift
//  PairProgrammingSettingView
//
//  Created by youngmin joo on 2017. 6. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation


struct TableData
{
    var sections:[SectionData] = []
    
    init(datas:[[String:Any]]) {
        for data:[String:Any] in datas
        {
           sections.append(SectionData(data: data))
        }
    }
}

struct SectionData {
    let header:String?
    var rows:[CellData]
    let footer:String?
    
    
    init(data:[String:Any]) {
        header  = data["sectionHeader"] as? String
        footer = data["sectionFooter"] as? String
        
        
        rows = []
        
        if let sData:[[String:Any]] = data["sectionRowDatas"] as? [[String:Any]]
        {
            
            for cellData in sData
            {
                rows.append(CellData(data: cellData))
            }
        }
    }
}


struct CellData {
    var title: String
    let type: CellType
    var subText: String?
    
    var nextData:TableData?
    
    let notiKey:String?
    let postKey:String?
    var notiName:NotiName{
        return NotiName(rawValue: postKey!) ?? NotiName.None
    }
    
    
    init(data:[String:Any]) {
        title = data["rowTitle"] as? String ?? "타이틀이 없음"
        notiKey = data["notiKey"] as? String
        postKey = data["postKey"] as? String
        
        if let typeStr =  data["cellType"] as? String
        {
            type = CellType(rawValue:typeStr) ?? .Basic
        }else
        {
            type = .Basic
        }
        
        if let detailData = data["detailData"] as? [[String:Any]]
        {
            nextData = TableData(datas: detailData)
        }

    }
}


enum NotiName:String {
    case None
    case Airplay = "airplayMode"
    case Wifi = "wifi"
}

enum CellType: String {
    case Basic = "basicCell"
    case Detail = "detailCell"
    case Switch = "switchCell"
}


class SettingCenter {
    

    
    //***********************************************//
    //                   Initalize                   //
    //***********************************************//
    //MARK:- Initalize
    static let sharedSetting:SettingCenter = SettingCenter()
    
    init()
    {
        loadSettingData()
    }
    
    
    //-----Cell type 가져오기 {get}
    //리턴 타입인 String을 열거형 타입으로 변경해야됨
//    func typeOfCellFor(rowAt indexPath:IndexPath) -> CellType
//    {
//        //settingMenuDataList에서 각 셀의 타입 가져오기
//        
////        //settingMenuDataList에서 각 로우의 타이틀 가져오기
////        guard let sectionDatas = settingMenuDataList  else
////        {
////            return .Basic
////        }
////        let sectionData:[String:Any] =  sectionDatas[indexPath.section] as! [String:Any]
////        //sectionData : 2개의 key "SectionTitle" , "Data"
////        let rowDataList = sectionData["Data"] as? [Any]
////        let rowData = rowDataList?[indexPath.row] as? [String:Any]
////        //rowData : keys = "CellStyle", "Content"
////        
////        ////////////////////////////////////////
////        //        let styleStr = rowData?["CellStyle"] as! String
////        //        let cellStyle:SettingCellType? =  SettingCellType(rawValue: styleStr)
////        //        return cellStyle ?? .Basic
////        
////        if let styleStr = rowData?["CellStyle"] as? String
////        {
////            let cellStyle:CellType? =  SettingCellType(rawValue: styleStr)
////            return cellStyle ?? .Basic
////        }else
////        {
////            return .Basic
////        }
//    }
    
    //***********************************************//
    //              Private Propertise               //
    //***********************************************//
    //MARK:- Private Propertise
    var settingData:TableData?
    
    
    //***********************************************//
    //                   DataLoad                    //
    //***********************************************//
    //MARK:- DataLoad
    
    //-----Settings.plist 에서 데이터 불러오기
    private func loadSettingData()
    {
        if let path = Bundle.main.path(forResource: "SettingData", ofType: "plist"),
        let dataList = NSArray(contentsOfFile: path) as? [[String:Any]]
        {
            settingData = TableData(datas: dataList)
        }
    }
    
    

    
    
}
