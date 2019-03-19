//
//  BindingTextfield.swift
//  WeatherApplicationMVVM
//
//  Created by Yestay Muratov on 2/28/19.
//  Copyright © 2019 Yestay Muratov. All rights reserved.
//

import Foundation
import UIKit

public class BindingTextfield: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    public var textChangeClosure: (String) -> () = { _ in }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        setupDesign()
    }
    
    func setupDesign(){
        self.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         commonInit()
    }
    
    public func bind(callback: @escaping (String) -> ()){
        self.textChangeClosure = callback
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textfieldChange(_:)), for: .editingChanged)
    }
    
    @objc func textfieldChange(_ textfield: UITextField){
        if let _text = textfield.text {
            self.textChangeClosure(_text)
        }
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
