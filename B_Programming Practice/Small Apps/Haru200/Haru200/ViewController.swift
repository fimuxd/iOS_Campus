//
//  ViewController.swift
//  Haru200
//
//  Created by Bo-Young PARK on 14/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITextViewDelegate, UITableViewDelegate, UIScrollViewDelegate{
    
    /*****************************************************************************/
    //                                IBOutlet 영역                               //
    /*****************************************************************************/
    
     @IBOutlet weak var tableView: UITableView!
    
    
    /*****************************************************************************/
    //                              enum 영역: 월표시                               //
    /*****************************************************************************/
    
    //    주석처리이유: 주석처리한 두 enum을 하기에 함수를 포함하는 하나의 enum으로 만들었습니다.
    
    //    enum nameOfMonth:String {
    //        case Jan = "January"
    //        case Feb = "February"
    //        case Mar = "March"
    //        case Apr = "April"
    //        case May = "May"
    //        case Jun = "June"
    //        case Jul = "July"
    //        case Aug = "August"
    //        case Sep = "September"
    //        case Oct = "October"
    //        case Nov = "November"
    //        case Dec = "December"
    //    }
    //
    //    enum dayOfMonth:Int {
    //        case January, February, March, April, May, June, July, August, September, October, November, December
    //    }
    
    
    //MARK: 월별로 월의 이름, 일수 등을 관리할 enum
    enum Month:Int {
        
        //Mark: raw value를 Int 값으로 갖는 case 설정
        case January, February, March, April, May, June, July, August, September, October, November, December
        
        
        //MARK: raw value 별로 월이름을 String으로 출력해주는 함수입니다. (추후 Table Section Header에 출력될 것)
        func monthName() -> String {
            switch self {
            case .January:
                return "January"
            case .February:
                return "February"
            case .March:
                return "March"
            case .April:
                return "April"
            case .May:
                return "May"
            case .June:
                return "June"
            case .July:
                return "July"
            case .August:
                return "August"
            case .September:
                return "September"
            case .October:
                return "October"
            case .November:
                return "November"
            case .December:
                return "December"
            }
        }
        
        //MARK: raw value 별로 월별 일수를 Int로 출력해주는 함수입니다. (추후 NumberOfRowInSection에 입력될 것)
        func monthCount() -> Int {
            
            let calendar = Calendar.current
            let dateComponents = DateComponents(year: 2017 , month: self.rawValue+1)
            let date = calendar.date(from: dateComponents)! //이 부분이 명확하게 어떤 의미인지 모르겠습니다.
            let range = calendar.range(of: .day, in: .month, for: date)!
            let numDays = range.count
            
            switch self {
            case .January:
                return numDays
            case .February:
                return numDays
            case .March:
                return numDays
            case .April:
                return numDays
            case .May:
                return numDays
            case .June:
                return numDays
            case .July:
                return numDays
            case .August:
                return numDays
            case .September:
                return numDays
            case .October:
                return numDays
            case .November:
                return numDays
            case .December:
                return numDays
            }
        }
    }
    
    
    /*****************************************************************************/
    //                          UITableViewDataSource                             //
    /*****************************************************************************/
    
    //MARK: section의 개수 -> 스크롤 하는대로 늘어나게 하려면? 예) 2017년 12월 이후 계속 스크롤 하면 2018년 1월 ~ 12월, 2019년 1월 ~ 12월...
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    //MARK: section별 row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Month(rawValue: section)!.monthCount()
//        switch section {
//        case Month.January.rawValue:
//            return Month.January.monthCount()      //처음엔 그냥 31, 28, 30 등의 Int를 직접 입력함
//        case Month.February.rawValue:
//            return Month.February.monthCount()
//        case Month.March.rawValue:
//            return Month.March.monthCount()
//        case Month.April.rawValue:
//            return Month.April.monthCount()
//        case Month.May.rawValue:
//            return Month.May.monthCount()
//        case Month.June.rawValue:
//            return Month.June.monthCount()
//        case Month.July.rawValue:
//            return Month.July.monthCount()
//        case Month.August.rawValue:
//            return Month.August.monthCount()
//        case Month.September.rawValue:
//            return Month.September.monthCount()
//        case Month.October.rawValue:
//            return Month.October.monthCount()
//        case Month.November.rawValue:
//            return Month.November.monthCount()
//        case Month.December.rawValue:
//            return Month.December.monthCount()
//        default:
//            return 0
//        }
    }
    
    
    //MARK: section title header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return Month(rawValue: section)!.monthName()
//        switch section {
//        case Month.January.rawValue:
//            return Month.January.monthName()
//        case Month.February.rawValue:
//            return Month.February.monthName()
//        case Month.March.rawValue:
//            return Month.March.monthName()
//        case Month.April.rawValue:
//            return Month.April.monthName()
//        case Month.May.rawValue:
//            return Month.May.monthName()
//        case Month.June.rawValue:
//            return Month.June.monthName()
//        case Month.July.rawValue:
//            return Month.July.monthName()
//        case Month.August.rawValue:
//            return Month.August.monthName()
//        case Month.September.rawValue:
//            return Month.September.monthName()
//        case Month.October.rawValue:
//            return Month.October.monthName()
//        case Month.November.rawValue:
//            return Month.November.monthName()
//        case Month.December.rawValue:
//            return Month.December.monthName()
//        default:
//            return ""
//        }
    }
    
    //MARK: Table View Cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ChagokTableViewCell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! ChagokTableViewCell
        
        cell.dateLabel.text = "\(indexPath.row+1)"
        cell.currentCharacterCount.text = "\(cell.diaryTextView.text.characters.count)/200" //글씨를 쓸때마다 새로고침 되려면?
        
        return cell
    }
    
    
    /*****************************************************************************/
    //                          Cell 내의 TextView Delegate                        //
    /*****************************************************************************/
    
    //MARK: TextView 글자수 제한
    // 하기의 extension 을 붙이고 나니까 NSRange에는 range가 없다는 말이 사라졌음. 이해하지 못했음 (Google 복붙)
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = range.range(for: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        return changedText.characters.count <= 200
    }
    
    
    //MARK: TextView PlaceHolder 역할 구현하기 (초기 회색글자;placeholder가 띄워져있을 땐, placeholder를 지우고 입력. 내용이 있을 땐 추가)
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor != .black {
            textView.text = ""
            textView.textColor = .black
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "하루를 차곡차곡 기록하세요"
            textView.textColor = .lightGray
        }else{
            UserDefaults.standard.array(forKey: "")
        }
        
    }
    
    
    
    
    
    /*****************************************************************************/
    //                                Life Cycle                                 //
    /*****************************************************************************/
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        /*
         // Date Class 연습 (구조 이해하기)
         
         // 오늘 날짜를 구한 뒤 (yyyy.mm.dd) 해당 날짜를 년.월.일로 구분하여 표시
         let date = Date()
         let dayFormatter = DateFormatter()
         let monthFormatter = DateFormatter()
         let yearFormatter = DateFormatter()
         
         dayFormatter.dateFormat = "dd"
         monthFormatter.dateFormat = "MM"
         yearFormatter.dateFormat = "yyyy"
         
         let dayResult = dayFormatter.string(from: date)
         let monthResult = monthFormatter.string(from: date)
         let yearResult = yearFormatter.string(from: date)
         
         print(dayResult) //일
         print(monthResult) //월
         print(yearResult) //년
         */
        
        
        /*****************************************************************************/
        //                  시작했을 때 오늘 날짜의 Cell로 자동 Scroll 하기                    //
        /*****************************************************************************/
 
        //오늘 날짜를 가져와서 DateFormatter 를 이용해, 월/일을 분리하여 설정합니다.
        let date = Date()
        let dayFormatter = DateFormatter()
        let monthFormatter = DateFormatter()
        
        dayFormatter.dateFormat = "dd"
        monthFormatter.dateFormat = "MM"
        
        let dayResult = dayFormatter.string(from: date)
        let monthResult = monthFormatter.string(from: date)
        
        //String 형태로 나온 오늘 날짜를 Int로 캐스팅 해준 뒤 이것을 IndexPath로 연결합니다.
        let todayIndexPath = IndexPath(row: Int(dayResult)!-1, section: Int(monthResult)!-1) //이 부분 나중에 Calender로 할 수 있음
        self.tableView.scrollToRow(at: todayIndexPath, at: .top, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

//MARK: TableView Cextension 부분 이해하지 못했음 (Google에서 복붙)
extension NSRange {
    func range(for str: String) -> Range<String.Index>? {
        guard location != NSNotFound else { return nil }
        
        guard let fromUTFIndex = str.utf16.index(str.utf16.startIndex, offsetBy: location, limitedBy: str.utf16.endIndex) else { return nil }
        guard let toUTFIndex = str.utf16.index(fromUTFIndex, offsetBy: length, limitedBy: str.utf16.endIndex) else { return nil }
        guard let fromIndex = String.Index(fromUTFIndex, within: str) else { return nil }
        guard let toIndex = String.Index(toUTFIndex, within: str) else { return nil }
        
        return fromIndex ..< toIndex
    }
}
