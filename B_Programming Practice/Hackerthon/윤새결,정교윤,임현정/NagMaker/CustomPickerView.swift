//
//  CustomPickerView.swift
//  NagMaker
//
//  Created by 정교윤 on 2017. 7. 6..
//  Copyright © 2017년 HyunJung. All rights reserved.
//

import Foundation

import UIKit

extension UITextField {
    func loadDropdownData(data: [String]) {
        self.inputView = CustomPickerView(pickerData: data, dropdownField: self)
    }
    
    func loadDropdownDataEditMode(data: [String], text:String) {
        self.inputView = CustomPickerView(pickerData: data, pickerText: text, dropdownField: self)
    }
    
    func loadDropdownData(data: [String], onSelect selectionHandler : @escaping (_ selectedText: String) -> Void) {
        print("Step 0")
        self.inputView = CustomPickerView.init(pickerData: data, dropdownField: self, onSelect: selectionHandler)
    }
}

class CustomPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var pickerData : [String]!
    var pickerTextField : UITextField!
    var pickerText : String?
    var selectionHandler : ((_ selectedText: String) -> Void)?
    
    init(pickerData: [String], dropdownField: UITextField) {
        super.init(frame: CGRect.zero)
        
        self.pickerData = pickerData
        self.pickerTextField = dropdownField
        
        self.delegate = self
        self.dataSource = self
        
        DispatchQueue.main.async(execute: {
            if pickerData.count > 0 {
                
                print("step 1")
                
                
                
                self.pickerTextField.text = self.pickerData[0]
                self.pickerTextField.isEnabled = true
                
                
            } else {
                self.pickerTextField.text = nil
                self.pickerTextField.isEnabled = false
            }
        })
        
        print(self.pickerTextField.text ?? "pickerTextField none")
        
        print(self.selectionHandler ?? "selectionHandler none")
        
        if self.pickerTextField.text != nil && self.selectionHandler != nil {
            print("step 2")
            
            selectionHandler!(self.pickerTextField.text!)
        }
    }
    
    init(pickerData: [String], pickerText: String, dropdownField: UITextField) {
        super.init(frame: CGRect.zero)
        
        self.pickerData = pickerData
        self.pickerTextField = dropdownField
        self.pickerText = pickerText
        
        self.delegate = self
        self.dataSource = self
        
        DispatchQueue.main.async(execute: {
            if pickerData.count > 0 {
                
                print("step 1")
                
                
                
                self.pickerTextField.text = self.pickerText
                self.pickerTextField.isEnabled = true
                
                
            } else {
                self.pickerTextField.text = nil
                self.pickerTextField.isEnabled = false
            }
        })
        
        print(self.pickerTextField.text ?? "pickerTextField none")
        
        print(self.selectionHandler ?? "selectionHandler none")
        
        if self.pickerTextField.text != nil && self.selectionHandler != nil {
            print("step 2")
            
            selectionHandler!(self.pickerTextField.text!)
        }
    }
    
    
    //    convenience init(pickerData: [String], dropdownField: UITextField, onSelect selectionHandler : @escaping (_ selectedText: String) -> Void)
    //    {
    //        self.init(pickerData: pickerData, dropdownField: dropdownField)
    //        self.selectionHandler = selectionHandler
    //
    //
    //    }
    
    convenience init(pickerData: [String], dropdownField: UITextField, onSelect selectionHandler : @escaping (_ selectedText: String) -> Void) {
        print("step 3")
        print(selectionHandler)
        self.init(pickerData: pickerData, dropdownField: dropdownField)
        self.selectionHandler = selectionHandler
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Sets number of columns in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //self.view.endEditing(true)
        //self.pickerTextField.endEditing(true)
        return pickerData[row]
    }
    
    // When user selects an option, this function will set the text of the text field to reflect
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickerData[row]
        
        print(pickerTextField.text ?? "none")
    }
    
    //    func textFieldDidBeginEditing(_ textField: UITextField) {
    //        print(textField.text ?? "textField none")
    //        print("textFieldDidBeginEditing")
    //    }
    
}
