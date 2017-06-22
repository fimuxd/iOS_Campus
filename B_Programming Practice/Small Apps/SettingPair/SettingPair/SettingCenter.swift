//
//  SettingCenter.swift
//  SettingPair
//
//  Created by joe on 2017. 6. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation

//Enum
enum CellTitle:String {
    case AirpainMode = "에어플레인 모드"
    case WiFi = "Wi-Fi"
    case Bluetooth = "Bluetooth"
    case Cellular = "셀룰러"
    case HotSpot = "개인용 핫스팟"
    case Carrier = "네트워크 사업자"
    case NoTitle = ""
}

enum CellType:String {
    case Basic = "BasicCell"
    case Detail = "DetailCell"
    case Custom = "CustomCell"
    case NoType = ""
}

enum DetailSectionFooter:String {
    case WiFi = "Wi-Fi를 켜면 위치 정확도가 향상됩니다."
    case Bluetooth = "Bluetooth를 켜면 위치 정확도 및 주변 서비스가 향상됩니다."
    case HotSpot = "iPhone의 인터넷 연결을 공유하려면 개인용 핫스팟을 켜십시오. 추가 요금이 부과될 수 있습니다. 사용자의 iCloud 계정으로 로그인된 다른 기기에서 수동으로 켜지 않아도 개인용 핫스팟을 사용할 수 있게 됩니다."
    //case CellularOption = "이메일, 웹 브라우징, 푸시 알림 등을 포함하여 모든 데이터를 Wi-Fi만 사용하도록 제한하려면 셀룰러 데이터를 끄십시오."
    case NoFooter = ""
}


class SettingCenter {
    
    /********************************************************/
    //                      Initialize                      //
    /********************************************************/
    //MARK: 초기화 하는 곳
    static let sectionList:SettingCenter = SettingCenter()
    
    var sectionDataList:[SectionData] = []          // 최초 Root Array 의미 (메인 셋팅 테이블뷰의 섹션)
    var rowDataList:[RowData] = []                  // 두번째 Array (메인 셋팅 테이블뷰의 셀/Row)
    var detailDataList:[SectionData] = []           // 세번째 Array (디테일 셋팅 테이블뷰의 섹션)
    
    var airplaneModeSectionDataList:[SectionData] = []
    var wifiSectionDataList:[SectionData] = []
    var bluetoothSectionDataList:[SectionData] = []
    var cellularSectionDataList:[SectionData] = []
    var hotSpotSectionDataList:[SectionData] = []
    var carrierSectionDataList:[SectionData] = []
    
    var airplaneModeRowDataList:[DetailRowData] = []
    var wifiRowDataList:[DetailRowData] = []
    var bluetoothRowonDataList:[DetailRowData] = []
    var cellularRowDataList:[DetailRowData] = []
    var hotSpotRowDataList:[DetailRowData] = []
    var carrierRowDataList:[DetailRowData] = []
    
    
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
                        self.detailDataList.append(detailItem)
                        
                        for dic in detailItem.rowData {
                            let detailRowItem = DetailRowData(withDictionary: dic as! [String:Any])
                            
                            switch detailRowItem.cellTitle.rawValue {
                            case "에어플레인 모드":
                                self.airplaneModeRowDataList.append(detailRowItem)
                            case "Wi-Fi":
                                self.wifiRowDataList.append(detailRowItem)
                            case "Bluetooth":
                                self.bluetoothRowonDataList.append(detailRowItem)
                            case "셀룰러":
                                self.cellularRowDataList.append(detailRowItem)
                            case "개인용 핫스팟":
                                self.hotSpotRowDataList.append(detailRowItem)
                            case "네트워크 사업자":
                                self.carrierRowDataList.append(detailRowItem)
                            default:
                                self.airplaneModeRowDataList.append(detailRowItem)
                            }
                        }
                        
                    }
                }
            }
        }
        airplaneModeSectionDataList.append(detailDataList[0])
        wifiSectionDataList.append(detailDataList[1])
        bluetoothSectionDataList.append(detailDataList[2])
        cellularSectionDataList.append(detailDataList[3])
        hotSpotSectionDataList.append(detailDataList[4])
        carrierSectionDataList.append(detailDataList[5])
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
        return sectionDataList[section].footerTitle.rawValue
    }
    
//    //3. Number of Section
//    func numberOfSection(in tableView:UITableView) -> Int {
//        return sectionDataList.count
//    }
    
    //4. Cell Title
    func cellTitle(forRowAt indexPath:IndexPath) -> String {
        return rowDataList[indexPath.row].cellTitle.rawValue
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
    
    //1. Section Header Title
    func detailHeaderTitle(forSectionAt section:Int) -> String {
        switch section {
        case 0:
            return airplaneModeSectionDataList[section].headerTitle
        case 1:
            return wifiSectionDataList[section].headerTitle
        case 2:
            return bluetoothSectionDataList[section].headerTitle
        case 3:
            return cellularSectionDataList[section].headerTitle
        case 4:
            return hotSpotSectionDataList[section].headerTitle
        case 5:
            return cellularSectionDataList[section].headerTitle
        default:
            return ""
        }
        
    }
    
    //2. Section Footer Title
    func detailFooterTitle(forSectionAt section:Int) -> String {
        switch section {
        case 0:
            return airplaneModeSectionDataList[section].footerTitle.rawValue
        case 1:
            return wifiSectionDataList[section].footerTitle.rawValue
        case 2:
            return bluetoothSectionDataList[section].footerTitle.rawValue
        case 3:
            return cellularSectionDataList[section].footerTitle.rawValue
        case 4:
            return hotSpotSectionDataList[section].footerTitle.rawValue
        case 5:
            return cellularSectionDataList[section].footerTitle.rawValue
        default:
            return ""
        }
    }
    
//    //3. Number of Section
//    func detailNumberOfSection(in tableView: UITableView) -> Int {
//        
//        switch tableView {
//        case 0:
//            return airplaneModeSectionDataList.count
//        case 1:
//            return wifiSectionDataList.count
//        case 2:
//            return bluetoothSectionDataList.count
//        case 3:
//            return cellularSectionDataList.count
//        case 4:
//            return hotSpotSectionDataList.count
//        case 5:
//            return cellularSectionDataList.count
//        default:
//            return 0
//        }
//    }
    
    //4. Cell Title
    func detailCellTitle(forRowAt indexPath:IndexPath) -> String {
        
        switch indexPath.row {
        case 0:
            return airplaneModeRowDataList[0].cellTitle.rawValue
        case 1:
            return wifiRowDataList[1].cellTitle.rawValue
        case 2:
            return bluetoothRowonDataList[2].cellTitle.rawValue
        case 3:
            return cellularRowDataList[3].cellTitle.rawValue
        case 4:
            return hotSpotRowDataList[4].cellTitle.rawValue
        case 5:
            return cellularRowDataList[5].cellTitle.rawValue
        default:
            return ""
        }
    }
    
    //5. Cell SubTitle
    func detailCellSubtitle(forRowAt indexPath:IndexPath) -> String {
        switch indexPath.row {
        case 0:
            return airplaneModeRowDataList[indexPath.row].cellSubtitle
        case 1:
            return wifiRowDataList[indexPath.row].cellSubtitle
        case 2:
            return bluetoothRowonDataList[indexPath.row].cellSubtitle
        case 3:
            return cellularRowDataList[indexPath.row].cellSubtitle
        case 4:
            return hotSpotRowDataList[indexPath.row].cellSubtitle
        case 5:
            return cellularRowDataList[indexPath.row].cellSubtitle
        default:
            return ""
        }
    }
    
    //6. Cell Type
    func detailCellType(forRowAt indexPath:IndexPath) -> CellType {
        switch indexPath.row {
        case 0:
            return airplaneModeRowDataList[indexPath.row].type
        case 1:
            return wifiRowDataList[indexPath.row].type
        case 2:
            return bluetoothRowonDataList[indexPath.row].type
        case 3:
            return cellularRowDataList[indexPath.row].type
        case 4:
            return hotSpotRowDataList[indexPath.row].type
        case 5:
            return cellularRowDataList[indexPath.row].type
        default:
            return .NoType
        }
    }
    
    //7. Number of Row in Section
    func numberOfDetailRow(_ inSection:Int) -> Int {
        switch inSection {
        case 0:
            return airplaneModeRowDataList.count
        case 1:
            return wifiRowDataList.count
        case 2:
            return bluetoothRowonDataList.count
        case 3:
            return cellularRowDataList.count
        case 4:
            return hotSpotRowDataList.count
        case 5:
            return cellularRowDataList.count
        default:
            return 0
        }
    }
    
}


struct SectionData {
    let headerTitle:String
    let footerTitle:DetailSectionFooter
    let rowData:[Any]
    
    var dic:[String:Any] {
        return ["SectionHeaderTitle":headerTitle,
                "SectionFooterTitle":footerTitle,
                "RowData":rowData]
    }
    
    init(withDictionary dic:[String:Any]) {
        self.headerTitle = dic["SectionHeaderTitle"] as? String ?? ""
        self.footerTitle = dic["SectionFooterTitle"] as? DetailSectionFooter ?? DetailSectionFooter(rawValue: "")!
        
        self.rowData = dic["RowData"] as? [[String:Any]] ?? []
    }
}


struct RowData {
    let cellTitle:CellTitle
    let cellSubtitle:String
    let type:CellType
    let detailData:[Any]
    
    var dict:[String:Any] {
        return ["Title":cellTitle, "Subtitle":cellSubtitle, "CellType":type, "DetailData": detailData]
    }
    
    init(withDictionary dict:[String:Any]) {
        self.cellTitle = CellTitle(rawValue: dict["Title"] as! String) ?? CellTitle(rawValue: "")!
        self.cellSubtitle = dict["Subtitle"] as? String ?? ""
        //        self.type = dict["CellType"] as! CellType
        self.type = CellType(rawValue: dict["CellType"] as! String) ?? CellType(rawValue: "")!
        self.detailData = dict["DetailData"] as? [[String:Any]] ?? []
    }
}

struct DetailRowData {
    let cellTitle:CellTitle
    let cellSubtitle:String
    let type:CellType
    
    var dict:[String:Any] {
        return ["Title":cellTitle, "Subtitle":cellSubtitle, "CellType":type]
    }
    
    init(withDictionary dict:[String:Any]) {
        self.cellTitle = CellTitle(rawValue: dict["Title"] as! String) ?? CellTitle(rawValue: "")!
        self.cellSubtitle = dict["Subtitle"] as? String ?? ""
        self.type = CellType(rawValue: dict["CellType"] as! String) ?? CellType(rawValue: "")!
    }
}

