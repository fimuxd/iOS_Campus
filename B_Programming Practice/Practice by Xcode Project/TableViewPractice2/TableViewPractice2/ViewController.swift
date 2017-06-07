//
//  ViewController.swift
//  TableViewPractice2
//
//  Created by Bo-Young PARK on 7/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    var myFriends:[String] = ["이재성","강성찬","조선미","서현종","김은영","임현정","이창호","정교윤","윤새결","박종훈","황기수","함형수","한동윤","김태형"]
    let hangul = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ","#"]
    var ㄱ:[String] = []
    var ㄴ:[String] = []
    var ㄷ:[String] = []
    var ㄹ:[String] = []
    var ㅁ:[String] = []
    var ㅂ:[String] = []
    var ㅅ:[String] = []
    var ㅇ:[String] = []
    var ㅈ:[String] = []
    var ㅊ:[String] = []
    var ㅋ:[String] = []
    var ㅌ:[String] = []
    var ㅍ:[String] = []
    var ㅎ:[String] = []
        
    /******************************/
    // 이름 정렬 메소드 생각해보기
    /******************************/
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        if UserDefaults.standard.string(forKey: "Name") != "" {
        myFriends.append(UserDefaults.standard.string(forKey: "Name")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myFriends = myFriends.sorted(by: <)
        
        
        //        print(sortedArr)
        
        // Do any additional setup after loading the view.
    }
    
    
    // Section 수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return hangul.count
    }
    
    // Section 별 Cell 수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
//        switch section {
//        case 0:
//            return ㄱ.count
//        case 1:
//            return ㄴ.count
//        case 2:
//            return ㄷ.count
//        case 3:
//            return ㄹ.count
//        case 4:
//            return ㅁ.count
//        case 5:
//            return ㅂ.count
//        case 6:
//            return ㅅ.count
//        case 7:
//            return ㅇ.count
//        case 8:
//            return ㅈ.count
//        case 9:
//            return ㅊ.count
//        case 10:
//            return ㅋ.count
//        case 11:
//            return ㅌ.count
//        case 12:
//            return ㅍ.count
//        case 13:
//            return ㅎ.count
//        
//        default:
//            return 0
//        }
    }

    // Header Title 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return hangul[section]
    }
    
    // Section IndexTitle 설정
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return hangul
    }
    
    // Section IndexTitle 갯수 설정
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return hangul.count
    }
    
    // 기본 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        cell.textLabel?.text = myFriends[indexPath.row]
        cell.imageView?.image = #imageLiteral(resourceName: "KakaoTalk_Photo_2017-06-01-16-18-07_57")
        cell.detailTextLabel?.text = "iOS Developer School"
        
        return cell
    }
    
    // cell 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }



    
    
    // 누르는 버튼/Cell에 따라 선택되는 Segue 설정 조건문
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC:DetailViewController = segue.destination as! DetailViewController
        
        if segue.identifier == "TouchedCellSegue" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            nextVC.defaultName = "\(cell.textLabel?.text)"
            
        } else if segue.identifier == "TouchedBtnSegue" {
            nextVC.isEditingMode = true
        }
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
