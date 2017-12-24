//
//  ViewController.swift
//  HackerTonePractice
//
//  Created by 김태형 on 2017. 7. 6..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    
    var data: User?

    let dateFormmater = DateFormatter()
    let date = Date()
    let calender = Calendar.current
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !UserDefaults.standard.bool(forKey: "logInStatus") {
            let logInVC: LogInViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            self.present(logInVC, animated: true, completion: nil)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.clear
        tableView.backgroundView = UIImageView(image: UIImage(named: "sam-ferrara-270946"))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.userData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! mainCustomCell
        
        cell.emotionImageView?.image = UIImage(named: (data?.userData[indexPath.row].emotion.rawValue)!)
        cell.userNameLabel.text = data?.userId
        cell.userTodayEmotion.text = convertText(to: (data?.userData[indexPath.row].emotion)!)
        cell.userComment.text = data?.userData[indexPath.row].comment
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }

    func loadData() {
        data = DataCenter.standard.user
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

