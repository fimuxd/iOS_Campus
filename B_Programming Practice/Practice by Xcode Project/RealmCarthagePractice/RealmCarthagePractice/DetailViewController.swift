//
//  DetailViewController.swift
//  RealmCarthagePractice
//
//  Created by 박종찬 on 2017. 7. 2..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    var displayingItemIndex: Int! {
        didSet {
            self.displyingItem = realm
                .object(ofType: Contact.self,
                        forPrimaryKey: displayingItemIndex)
            
        }
    }
    var displyingItem: Contact!

    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var birthDayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter: DateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "MMM d yyyy"
        
        self.title = displyingItem.name
        self.birthDayLabel.text = dateFormatter.string(from: displyingItem.birthDay!)
        self.phoneNumberLabel.text = displyingItem.phoneNumeber
        
        // Do any additional setup after loading the view.
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
