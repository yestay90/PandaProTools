//
//  TestDateTextfieldViewController.swift
//  PandaProTools_Example
//
//  Created by Yestay Muratov on 11/22/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import PandaProTools

class DateTextfieldViewController: UIViewController {
    
    lazy var dateTextfield: DateTextField = {
        let v = DateTextField() // you can also create date textfield with custom properties
        v.dateDelegate = self
        v.toolBarBackgroundColor = .red
        v.backgroundColor = .purple
        v.attributedPlaceholder = AttributedTextManager.getAttributedText("Choose Date", font: UIFont.systemFont(ofSize: 14), color: .white)
        return v
    }()
    
    var chosenDate: Date? {
        didSet {
            dateTextfield.text = chosenDate?.toString("dd MMM yyyyy")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(dateTextfield)
        view.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: dateTextfield)
        view.addConstraintsWithFormat("V:|-120-[v0(44)]", views: dateTextfield)
    }
}

extension DateTextfieldViewController: DateTextFieldDelegate {
    func dateTextFieldDelegate(didChoose date: Date, textfield: UITextField) {
        chosenDate = date
    }
    
    func dateTextFieldDelegate(readyButtonClicked button: UIBarButtonItem, textfield: UITextField) {
        self.view.endEditing(true)
    }
    
    func dateTextFieldDelegate(cancelButtonClicked button: UIBarButtonItem, textfield: UITextField) {
        chosenDate = nil
        self.view.endEditing(true)
    }
}
