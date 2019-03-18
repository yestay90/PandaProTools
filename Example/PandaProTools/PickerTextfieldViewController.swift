//
//  PickerTextfieldViewController.swift
//  PandaProTools_Example
//
//  Created by Yestay Muratov on 3/18/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import PandaProTools

class PickerTextfieldViewController: UIViewController {
    
    lazy var firstTextfield: PickerTextField = {
        let v = PickerTextField() // you can also create date textfield with custom properties
        v.pickerDelegate = self
        v.toolBarBackgroundColor = .red 
        v.backgroundColor = .purple
        v.attributedPlaceholder = AttributedTextManager.getAttributedText("First Name", font: UIFont.systemFont(ofSize: 14), color: .white)
        
        return v
    }()
    
    lazy var lastTextfield: PickerTextField = {
        let v = PickerTextField() // you can also create date textfield with custom properties
        v.pickerDelegate = self
        v.toolBarBackgroundColor = .red
        v.backgroundColor = .purple
        v.attributedPlaceholder = AttributedTextManager.getAttributedText("Last Name", font: UIFont.systemFont(ofSize: 14), color: .white)
        return v
    }()
    
    var firstNames = [
        "Yestay",
        "Misha",
        "Yeldar",
        "Kadik"
    ]
    
    var lastNames = [
        "Kim",
        "Muratov",
        "KKK",
        "KudaiBergen",
        "One more last name"
    ]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    func setupViews(){
        view.backgroundColor = .white
        [firstTextfield, lastTextfield].forEach{
            value in
            
            self.view.addSubview(value)
            self.view.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: value)
        }
        
        self.view.addConstraintsWithFormat("V:|-200-[v0(44)]-16-[v1(44)]", views: firstTextfield, lastTextfield)
    }
}

extension PickerTextfieldViewController: PickerTextFieldDelegate {
    
    func pickerTextField(textfield: UITextField, pickerView: UIPickerView, didSelect row: Int) {
        switch textfield {
        case firstTextfield:
            firstTextfield.text = firstNames[row]
        case lastTextfield:
            lastTextfield.text = lastNames[row]
        default:
            break
        }
    }
    
    func pickerTextField(textfield: UITextField, pickerView: UIPickerView, titleForRow row: Int) -> String {
        switch textfield {
        case self.firstTextfield:
            return firstNames[row]
        case self.lastTextfield:
            return lastNames[row]
        default:
            return ""
        }
    }
    
    func pickerTextFieldNumberOfRows(textfield: UITextField, pickerView: UIPickerView) -> Int {
        switch textfield {
        case firstTextfield:
            return firstNames.count
        case lastTextfield:
            return lastNames.count
        default:
            return 0
        }
    }
    
    func pickerTextField(readyButtonClicked button: UIBarButtonItem, textfield: UITextField) {
        switch textfield {
        case firstTextfield:
            firstTextfield.text = "Ready button clicked"
        case lastTextfield:
            lastTextfield.text = "Ready button clicked"
        default:
            break
        }
    }
    
    func pickerTextField(cancelButtonClicked button: UIBarButtonItem, textfield: UITextField) {
        switch textfield {
        case firstTextfield:
            firstTextfield.text = "Cancel button clicked"
        case lastTextfield:
            lastTextfield.text = "Cancel button clicked"
        default:
            break
        }
    }
}
