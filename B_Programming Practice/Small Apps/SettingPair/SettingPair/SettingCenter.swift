//
//  SettingCenter.swift
//  SettingPair
//
//  Created by joe on 2017. 6. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation

//MARK: enum 영역
enum CellType:String {
    case Basic = "BasicCell"
    case Detail = "DetailCell"
    case Custom = "CustomCell"
}

/*
//MARK: struct 영역
//-----TableView의 Section Datas
struct SectionData {
    let headerTitle:String
    let footerTitle:String
    let cellDataList:[Any]
    
    var dic:[String:Any] {
        return ["SectionHeaderTitle":headerTitle,
                "SectionFooterTitle":footerTitle,
                "RowData":cellDataList]
    }
    
    init(withDictionary dic:[String:Any]) {
        self.headerTitle = dic["SectionHeaderTitle"] as? String ?? ""
        self.footerTitle = dic["SectionFooterTitle"] as? String ?? ""
        self.cellDataList = dic["RowData"] as? [[String:Any]] ?? []
    }
}

//-----TableView의 Row(Cell) Datas
struct RowData {
    let cellTitle:String
    let cellSubtitle:String
    let type:CellType
    let detailData:[Any]?
    
    var dic:[String:Any] {
        return ["Title":cellTitle, "Subtitle":cellSubtitle, "CellType":type, "DetailData": detailData]
    }
    
    init(withDictionary dic:[String:Any]) {
        self.cellTitle = dic["Title"] as? String ?? ""
        self.cellSubtitle = dic["Subtitle"] as? String ?? ""
        self.type = CellType(rawValue: dic["CellType"] as! String) ?? .Basic
        
        if let tempDetailData = dic["DetailData"] as? [[String:Any]] {
            if tempDetailData.count != 0 {
                //Array에 값을 넣을 함수 입력
            }else{
                detailData = nil
            }
        }
    }
}


//MARK: 함수영역 - from [[:]] to [:]
//-----RowDataArray에서 RowData를 얻는 함수
func convertAnyTo(row datas:[[String:Any]]) -> [RowData] {
    var tempRowDataList:[RowData] = []
    for tempRowDic in datas {
        let tempRow = RowData(withDictionary: tempRowDic)
        tempRowDataList.append(tempRow)
    }
    return tempRowDataList
}

//-----SectionDataArray에서 SectionData를 얻는 함수
func convertAnyTo(section datas:[[String:Any]]) -> [SectionData] {
    var tempSectionData:[SectionData] = []
    for tempSectionDictionary in datas {
        let tempSectionHeaderTitle = tempSectionDictionary["SectionHeaderTitle"] as! String
        let tempSectionFooterTitle = tempSectionDictionary["SectionFooterTitle"] as! String
        let tempCellData:SectionData = SectionData(withDictionary: tempSectionDictionary as! [String:Any])
        tempSectionData.append(tempCellData)
    }
    return tempSectionData
}

*/

//MARK: SettingCenter Class 영역
class SettingCenter {
    
    /********************************************************/
    //                      Initialize                      //
    /********************************************************/
    //MARK: 초기화 하는 곳
    static let sectionList:SettingCenter = SettingCenter()
    
    var sectionDataList:[SectionData] = []          // 최초 Root Array 의미 (메인 셋팅 테이블뷰의 섹션)
    var rowDataList:[RowData] = []                  // 두번째 Array (메인 셋팅 테이블뷰의 셀/Row)
    var detailSectionDataList:[SectionData] = []    // 세번째 Array (디테일 셋팅 테이블뷰의 섹션)
    var detailRowDataList:[DetailRowData] = []      // 네번째 Array (디테일 셋팅 테이블뷰의 셀/Row)
    
//    var airplaneModeSectionDataList:[SectionData] = []
//    var wifiSectionDataList:[SectionData] = []
//    var bluetoothSectionDataList:[SectionData] = []
//    var cellularSectionDataList:[SectionData] = []
//    var hotSpotSectionDataList:[SectionData] = []
//    var carrierSectionDataList:[SectionData] = []
//    
//    var airplaneModeRowDataList:[DetailRowData] = []
//    var wifiRowDataList:[DetailRowData] = []
//    var bluetoothRowonDataList:[DetailRowData] = []
//    var cellularRowDataList:[DetailRowData] = []
//    var hotSpotRowDataList:[DetailRowData] = []
//    var carrierRowDataList:[DetailRowData] = []
    
    
    init() {
        load()
    }
    
    func load() {
        
        let path = Bundle.main.path(forResource: "SettingData", ofType: "plist")
        let sectionArray = NSArray(contentsOfFile: path!) as? [Any]
        
        if let array = sectionArray {
            for dic in array {
                let item = SectionData(withDictionary: dic as! [String:Any])
                self.sectionDataList.append(item)
                
                for dic in item.rowData {
                    let rowItem = RowData(withDictionary: dic as! [String:Any])
                    self.rowDataList.append(rowItem)
                    
                    for dic in rowItem.detailData {
                        let detailItem = SectionData(withDictionary: dic as! [String:Any])
                        self.detailSectionDataList.append(detailItem)
                        
                        for dic in detailItem.rowData {
                            let detailRowItem = DetailRowData(withDictionary: dic as! [String:Any])
                            self.detailRowDataList.append(detailRowItem)
                        }
                        
                    }
                }
            }
        }
    }
    
    
    
    /********************************************************/
    //            최초 Setting 부분 TableView 관련 함수          //
    /********************************************************/
    //MARK: 최초 ViewController 부분
    
    //1. Section Header Title
    func headerTitle(forSectionAt section:Int) -> String {
        return sectionDataList[section].headerTitle
    }
    
    //2. Section Footer Title
    func footerTitle(forSectionAt section:Int) -> String {
        return sectionDataList[section].footerTitle
    }
    
    //3. Number of Section
    func numberOfSection() -> Int {
        return sectionDataList.count
    }
    
    //4. Cell Title
    func cellTitle(forRowAt indexPath:IndexPath) -> String {
        return rowDataList[indexPath.row].cellTitle
    }
    
    //5. Cell SubTitle
    func cellSubtitle(forRowAt indexPath:IndexPath) -> String {
        return rowDataList[indexPath.row].cellSubtitle
    }
    
    //6. Cell Type
    func cellType(forRowAt indexPath:IndexPath) -> CellType {
        return rowDataList[indexPath.row].type
    }
    
    //7. Number of Row in Section
    func numberOfRow(_ inSection:Int) -> Int {
        return rowDataList.count
    }
    
    /********************************************************/
    //              Detail 부분 TableView 관련 함수             //
    /********************************************************/
    //MARK: WiFi, Bluetooth 등 DetailViewController 부분

    
// 처음에 만들었던 함수들 _ 중복이므로 필요 없음
/*
    //1. Section Header Title
    func detailHeaderTitle(forSectionAt section:Int) -> String {
            return detailSectionDataList[section].headerTitle
    }
    
    //2. Section Footer Title
    func detailFooterTitle(forSectionAt section:Int) -> String {

    }
    
    //3. Number of Section
    func detailNumberOfSection(for) -> Int {
        
        switch tableView {
        case 0:
            return airplaneModeSectionDataList.count
        case 1:
            return wifiSectionDataList.count
        case 2:
            return bluetoothSectionDataList.count
        case 3:
            return cellularSectionDataList.count
        case 4:
            return hotSpotSectionDataList.count
        case 5:
            return cellularSectionDataList.count
        default:
            return 0
        }
    }
    
    //4. Cell Title
    func detailCellTitle(forRowAt indexPath:IndexPath) -> String {

    }
    
    //5. Cell SubTitle
    func detailCellSubtitle(forRowAt indexPath:IndexPath) -> String {
          }
    
    //6. Cell Type
    func detailCellType(forRowAt indexPath:IndexPath) -> CellType {
            }
    
    //7. Number of Row in Section
    func numberOfDetailRow(_ inSection:Int) -> Int {
*/
}


struct SectionData {
    let headerTitle:String
    let footerTitle:String
    let rowData:[Any]
    
    var dic:[String:Any] {
        return ["SectionHeaderTitle":headerTitle,
                "SectionFooterTitle":footerTitle,
                "RowData":rowData]
    }
    
    init(withDictionary dic:[String:Any]) {
        self.headerTitle = dic["SectionHeaderTitle"] as? String ?? ""
        self.footerTitle = dic["SectionFooterTitle"] as? String ?? ""
        self.rowData = dic["RowData"] as? [[String:Any]] ?? []
    }
}


struct RowData {
    let cellTitle:String
    let cellSubtitle:String
    let type:CellType
    let detailData:[Any]
    
    var dict:[String:Any] {
        return ["Title":cellTitle, "Subtitle":cellSubtitle, "CellType":type, "DetailData": detailData]
    }
    
    init(withDictionary dict:[String:Any]) {
        self.cellTitle = dict["Title"] as? String ?? ""
        self.cellSubtitle = dict["Subtitle"] as? String ?? ""
        self.type = CellType(rawValue: dict["CellType"] as! String) ?? .Basic
        self.detailData = dict["DetailData"] as? [[String:Any]] ?? []
    }
}

struct DetailRowData {
    let cellTitle:String
    let cellSubtitle:String
    let type:CellType
    
    var dict:[String:Any] {
        return ["Title":cellTitle, "Subtitle":cellSubtitle, "CellType":type]
    }
    
    init(withDictionary dict:[String:Any]) {
        self.cellTitle = dict["Title"] as? String ?? ""
        self.cellSubtitle = dict["Subtitle"] as? String ?? ""
        self.type = CellType(rawValue: dict["CellType"] as! String) ?? .Basic
    }
}

