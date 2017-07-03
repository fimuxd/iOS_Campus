//
//  AddViewController.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonTouched(_ sender: UIBarButtonItem) {
        
        //지금까지 있는 사람 수를 새로운 아이디로 넘긴다.
        DataCenter.shared.addPerson(["person_id":DataCenter.shared.dataArray.count, "name":nameTextField.text!, "gender":genderSegmentedControl.selectedSegmentIndex, "age":Int(ageTextField.text!)!, "phone_number":phoneNumberTextField.text!])
        
        self.navigationController?.popViewController(animated: true)
        
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
