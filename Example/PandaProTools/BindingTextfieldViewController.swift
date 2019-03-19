//
//  BindingTextfieldViewController.swift
//  PandaProTools_Example
//
//  Created by Yestay Muratov on 3/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import PandaProTools

class BindingTextfieldViewController: UIViewController {
    
    lazy var bindingTextField: BindingTextfield = {
        let b = BindingTextfield()
        return b
    }()
    
    let labelTitle: UILabel = {
        let l = UILabel()
        l.text = "Text will be changed here"
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        bind()
    }
    
    func bind(){
        bindingTextField.bind { [weak self] value in
            self?.labelTitle.text = value
        }
    }
    
    func setupViews(){
        self.view.backgroundColor = .white 
        self.view.addSubview(bindingTextField)
        self.view.addSubview(labelTitle)
        
        self.view.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: bindingTextField)
           self.view.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: labelTitle)
        self.view.addConstraintsWithFormat("V:|-200-[v0(44)]-16-[v1]", views: bindingTextField, labelTitle)
    }
}
