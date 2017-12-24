//
//  FriendEmotionVC.swift
//  DailyEmotion
//
//  Created by Hyoungsu Ham on 2017. 7. 7..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class FriendEmotionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friendData: [User] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.dataSource = self
//        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendData[section].userData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! mainCustomCell
        
        cell.emotionImageView?.image = UIImage(named: (friendData[indexPath.section].userData[indexPath.row].emotion.rawValue))
        cell.userNameLabel.text = friendData[indexPath.row].userId
        cell.userTodayEmotion.text = convertText(to: friendData[indexPath.section].userData[indexPath.row].emotion)
        cell.userComment.text = friendData[indexPath.section].userData[indexPath.row].comment
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func loadData() {
        friendData = (DataCenter.standard.user?.friendList)!
    }
    
    
    func convertText(to rawValue:Emotion) -> String {
        switch rawValue {
        case .joy:
            return "기뻐요 :)"
        case .anger:
            return "짜증나요 :("
        case .breathigh:
            return "두근두근해요 :)"
        case .displeasure:
            return "우울해요 :("
        case .glad:
            return "신나요 :)"
        case .happy:
            return "행복해요 :)"
        case .melancholy:
            return "화나요 :("
        case .sad:
            return "슬퍼요 :("
        }
    }
}
