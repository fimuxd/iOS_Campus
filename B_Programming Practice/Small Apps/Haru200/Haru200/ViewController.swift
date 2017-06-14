//
//  ViewController.swift
//  Haru200
//
//  Created by Bo-Young PARK on 14/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITextViewDelegate, UITableViewDelegate{
    
    /*****************************************************************************/
    //                              enum 영역: 월표시                               //
    /*****************************************************************************/
    
    //    주석처리이유: 주석처리한 두 enum을 하기 하나의 enum으로 만들었습니다.
    
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
    
    enum month:Int {
        case January, February, March, April, May, June, July, August, September, October, November, December
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
    }
    
    
    /*****************************************************************************/
    //                          UITableViewDataSource                             //
    /*****************************************************************************/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case month.January.rawValue:
            return 31                       //추후 Date type을 이해하면, 여기에 그 값을 넣을 수 있을 것 같음.
        case month.February.rawValue:
            return 28
        case month.March.rawValue:
            return 31
        case month.April.rawValue:
            return 30
        case month.May.rawValue:
            return 31
        case month.June.rawValue:
            return 30
        case month.July.rawValue:
            return 31
        case month.August.rawValue:
            return 31
        case month.September.rawValue:
            return 30
        case month.October.rawValue:
            return 31
        case month.November.rawValue:
            return 30
        case month.December.rawValue:
            return 31
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case month.January.rawValue:
            return month.January.monthName()
        case month.February.rawValue:
            return month.February.monthName()
        case month.March.rawValue:
            return month.March.monthName()
        case month.April.rawValue:
            return month.April.monthName()
        case month.May.rawValue:
            return month.May.monthName()
        case month.June.rawValue:
            return month.June.monthName()
        case month.July.rawValue:
            return month.July.monthName()
        case month.August.rawValue:
            return month.August.monthName()
        case month.September.rawValue:
            return month.September.monthName()
        case month.October.rawValue:
            return month.October.monthName()
        case month.November.rawValue:
            return month.November.monthName()
        case month.December.rawValue:
            return month.December.monthName()
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ChagokTableViewCell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! ChagokTableViewCell
        
        cell.dateLabel.text = "\(indexPath.row+1)"
        cell.currentCharacterCount.text = "\(cell.diaryTextView.text.characters.count)/200"
        
        return cell
    }
    
    
    /*****************************************************************************/
    //                          Cell 내의 TextView Delegate                        //
    /*****************************************************************************/
    
    //Mark: TextView 글자수 제한
    // 하기의 extension 을 붙이고 나니까 NSRange에는 range가 없다는 말이 사라졌음. 이해하지 못했음 (Google 복붙)
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = range.range(for: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        return changedText.characters.count <= 200
    }
    
    
    //Mark: TextView PlaceHolder 역할 구현하기 (초기 회색글자;placeholder가 띄워져있을 땐, placeholder를 지우고 입력. 내용이 있을 땐 추가)
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
        
        
        // 각 해의 월별 일수 구하기
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        
        print(calendar)
        print(range)
        print(numDays)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

// extension 부분 이해하지 못했음 (Google에서 복붙)
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
