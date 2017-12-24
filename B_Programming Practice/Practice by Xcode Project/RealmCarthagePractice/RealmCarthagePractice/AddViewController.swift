//
//  AddViewController.swift
//  RealmCarthagePractice
//
//  Created by 박종찬 on 2017. 7. 2..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UINavigationBarDelegate {
    

    
    //Controls
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var datePickerForBirthDay: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButtonTouched(_ sender: UIBarButtonItem) {
        
        let contact: Contact = Contact()
        contact.name = nameTextField.text!
        contact.phoneNumeber = phoneNumberTextField.text!
        contact.birthDay = datePickerForBirthDay.date
        contact.createNewPrimaryKey()
        
        addToRealm(contact)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - NavigationBarDelegate
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }


}
