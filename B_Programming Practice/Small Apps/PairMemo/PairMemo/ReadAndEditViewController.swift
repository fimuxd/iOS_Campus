//
//  ReadAndEditViewController.swift
//  PairMemo
//
//  Created by Hyoungsu Ham on 2017. 6. 8..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class ReadAndEditViewController: UIViewController, UITextFieldDelegate {
    
    var texttitle: String?
    var contents: String?
    var indexpath : Int?
    
    //이게 타이틀 제목입니다 제성합니당
    @IBOutlet weak var readAndContentcontentField: UITextField!
    //이게 내용이에여....
    @IBOutlet weak var contentsTextField: UITextField!
    //done버튼이고 하나는 히든시킬아울렛 하나는 저장할 액
    @IBOutlet weak var editDoneBtnOutlet: UIButton!
    
    @IBAction func EditDoneRealBtn(_ sender: UIButton) {
    
        let indexPath:Int = indexpath!
        
        var editmemolist = UserDefaults.standard.array(forKey:"memoList") as? [[String:String]] ?? []
        
        let title:String = self.readAndContentcontentField.text!
        let contant:String = self.contentsTextField.text!
        
        var memo: [String:String] = ["title":title, "contant":contant]
        
        editmemolist.remove(at: Int(indexPath))
        editmemolist.insert(memo, at: Int(indexPath))
        UserDefaults.standard.set(editmemolist, forKey: "memoList")
        
        self.navigationController?.popViewController(animated: true)
        
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textTitle:String = texttitle!
        let content:String = contents!
        let indexPath:Int = indexpath!
        
        
        print(indexPath)
        self.readAndContentcontentField.text = textTitle ?? "No title"
        self.contentsTextField.text = content ?? "No content"
        
        self.editDoneBtnOutlet.isHidden = true
        
                 // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.editDoneBtnOutlet.isHidden = false
    }


}
