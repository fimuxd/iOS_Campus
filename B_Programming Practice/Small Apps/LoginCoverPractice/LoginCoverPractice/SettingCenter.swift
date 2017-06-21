//
//  SettingCenter.swift
//  LogInCoverPractice
//
//  Created by Bo-Young PARK on 20/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

enum SettingCellType:String {
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
}


//Setting Data 들을 관리하는 곳

class SettingCenter {
    
    //******************************************//
    //                 Initialize               //
    //******************************************//
    //MARK: Initialize
    
    static var sharedSetting:SettingCenter = SettingCenter()
    var settingMenuDataList:[Any]?
    
    
    //******************************************//
    //            Private Properties            //
    //******************************************//
    //MARK: Private Properties
    
    //-----연산프로퍼티를 이용한 Singleton 패턴
    private init() {
        loadSettingData()
    }
    
    //-----"Settings.plist 에서 데이터 불러오기"
    func loadSettingData() {
        guard let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
            let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any] else {
                return
        }
        self.settingMenuDataList = settingMenuDataList
    }
    
    
    //------섹션의 개수 알려주는 연산 프로퍼티
    var sectionCount:Int {
        return settingMenuDataList?.count ?? 0
    }
    
    //-----Row의 개수 알려주는 함수
    func rowCountFor(_ section:Int) -> Int {
        guard let sectionDatas = settingMenuDataList else {
            return 0
        }
        let sectionDataDic:[String:Any] = settingMenuDataList![section] as! [String:Any] //sectionDataDic에는 두가지 key가 있다. "SectionTitle", "Data"
        
        if let rowDataList = sectionDataDic["Data"] as? [Any] {
             return rowDataList.count
        }else{
            return 0
        }
        
    }
    
    //-----섹션 타이틀 가져오기 {get}
    func titleFor(section:Int) -> String {
        guard let sectionDatas = settingMenuDataList else {
            return "No Section Title"
        }
        let dic:[String:Any] = sectionDatas[section] as! [String:Any]
        let sectionTitle = dic["SectionTitle"] as? String
        return sectionTitle ?? "No Section Title"
    }
    
    //-----Cell 타이틀 가져오기 {get}
    func titleFor(rowAtIndexPath indexPath:IndexPath) -> String {
        //settingMenuDataList에서 각 Row의 Title 가져오기
        guard let sectionDatas = settingMenuDataList else {
            return "No Section Title"
        }
        
        //1. Setion을 나타내는 Dictionary를 가져온다.
        let sectionDataDic:[String:Any] = sectionDatas[indexPath.section] as! [String:Any] //sectionDataDic에는 두가지 key가 있다. "SectionTitle", "Data"
        
        //2. Dictionary에서 Data Array를 가져온다.
        let rowDataList = sectionDataDic["Data"] as? [Any]
        
        //3. Array에서 다시 Dictionary를 가져온다.
        let rowDataDic = rowDataList?[indexPath.row] as? [String:Any] //rowDataDic에는 두가지 key가 있다. "CellStyle", "Content"
        
        //4. Dictionary에서 rowTitle을 가져온다.
        let rowTitle = rowDataDic?["Content"] as? String
    
        return rowTitle ?? "no Title" //아직 구현전입니다.
    }
    
    //-----Cell type 가져오기 {get}
    //리턴 타입인 String을 열거형 타입으로 변경해야 됨
    func typeOfCellFor(rowAtIndexPath indexPath:IndexPath) -> SettingCellType {
        //settingMenuDataList에서 각 Cell의 Type 가져오기
        
        guard let sectionDatas = settingMenuDataList else {
            return .Basic
        }

        let sectionDataDic:[String:Any] = sectionDatas[indexPath.section] as! [String:Any] //sectionDataDic에는 두가지 key가 있다. "SectionTitle", "Data"
        let rowDataList = sectionDataDic["Data"] as? [Any]
        let rowDataDic = rowDataList?[indexPath.row] as? [String:Any] //rowDataDic에는 두가지 key가 있다. "CellStyle", "Content"
        
        //-----CellTitle 가져오기랑 똑같다. 다만 하기와 같이 return 값에 대해 옵셔널 바인딩을 하는 부분만 다르다.
        if let styleStr = rowDataDic?["CellStyle"] as? String {
            let cellStyle:SettingCellType? = SettingCellType(rawValue:styleStr)
            return cellStyle ?? .Basic
        }else{
            return .Basic
        }
        
    }
    
}
