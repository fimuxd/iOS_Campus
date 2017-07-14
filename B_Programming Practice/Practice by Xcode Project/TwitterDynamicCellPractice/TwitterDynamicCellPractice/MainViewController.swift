//
//  MainViewController.swift
//  TwitterDynamicCellPractice
//
//  Created by Bo-Young PARK on 13/7/2017.
//  Copyright © 2017 Jongchan Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    //******************************************//
    //                  IBOutlet                //
    //******************************************//
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var newTwitTextField: UITextView!
    @IBOutlet weak var textCountLabel: UILabel!
    
    @IBOutlet weak var popUpViewY: NSLayoutConstraint!
    @IBOutlet weak var subBackgroundView: UIView!
    
    //******************************************//
    //              IBAction/함수영역              //
    //******************************************//
    
    @IBAction func addTwitButtonAction(_ sender: UIButton) {
        self.subBackgroundView.isHidden = false
        self.popUpViewY.constant = -100
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        self.newTwitTextField.text = "What's happening?"
        self.newTwitTextField.textColor = .gray
        self.textCountLabel.text = ""
    }
    
    @IBAction func dismissPopUpViewButtonAction(_ sender: UIButton) {
        self.subBackgroundView.isHidden = true
        self.newTwitTextField.resignFirstResponder()
        self.popUpViewY.constant = -353
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.newTwitTextField.text = ""
        self.textCountLabel.text = "140/140"
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentCharacterCount = textView.text.characters.count ?? 0
        
        if(range.length + range.location > currentCharacterCount) {
            return false
        }
        let newLength = currentCharacterCount + text.characters.count - range.length
        self.textCountLabel.text = "\(newLength)/140"
        return newLength < 140
    }
    
    @IBAction func updateTwitButtonAction(_ sender: UIButton) {
        DataCenter.shared.addTwit(["user_name":"Bo-Young Park",
                                   "user_id":"@fimuxd",
                                   "user_profile_img_url":"",
                                   "body_text":self.newTwitTextField.text!,
                                   "img_url":""])
        
        self.subBackgroundView.isHidden = true
        self.newTwitTextField.resignFirstResponder()
        self.popUpViewY.constant = -353
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        
        self.tableView.reloadData()
    }
    
    @IBAction func refreshButtonAction(_ sender: UIButton) {
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomDynamicTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TwitCell", for: indexPath) as! CustomDynamicTableViewCell
            
        cell.nameLabel.text = DataCenter.shared.dataArray[indexPath.row].userName
        cell.twitterIDLabel.text = DataCenter.shared.dataArray[indexPath.row].userId
        cell.bodyTextLabel.text = DataCenter.shared.dataArray[indexPath.row].bodyText
        
        cell.profileButtonOutlet.setImage(UIImage(named: DataCenter.shared.dataArray[indexPath.row].userPhotoUrl), for: .normal)
        
        if let realImageUrl = DataCenter.shared.dataArray[indexPath.row].imageUrl {
            cell.inputImageButtonOutlet.setImage(UIImage(named: realImageUrl), for: .normal)
        }
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            DataCenter.shared.removeTwit(at: indexPath.row)
        }
    }
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.subBackgroundView.isHidden = true
        self.newTwitTextField.layer.cornerRadius = 15

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customDynamicTableViewCell:UINib = UINib(nibName: "CustomDynamicTableViewCell", bundle: nil)
        tableView.register(customDynamicTableViewCell, forCellReuseIdentifier: "TwitCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
