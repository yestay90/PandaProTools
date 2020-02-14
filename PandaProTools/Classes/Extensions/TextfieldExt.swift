//
//  TextfieldExt.swift
//  SmartAstana
//
//  Created by Yestay Muratov on 11/14/18.
//  Copyright © 2018 PandaMobile. All rights reserved.
//

import Foundation

extension UITextField{
    func setImageOnRightSide(image: UIImage, tintColor: UIColor = .black){
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.image = image
        imageView.tintColor = tintColor
        let view = UIView(frame : CGRect(x: 0, y: 0, width: 30, height: 30))
        view.addSubview(imageView)
        rightView = view
    }
    
    func setImageOnLeftSide(image: UIImage){
        leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.image = image
        let view = UIView(frame : CGRect(x: 0, y: 0, width: 30, height: 30))
        view.addSubview(imageView)
        leftView = view
    }
    
//    func setAttibutedPlaceholder(text: String, textColor: UIColor = .black){
//        self.attributedPlaceholder = AttributedTextManager.getAttributedText(text, font: UIFont.systemFont(ofSize: 14), color: textColor)
//        // CommonFunctions.getAttributedText(text, size: 14, color: textColor)
//    }
//    
//    func setColorToAttibutedPlaceholder(hexColor: String){
//        if let placeHolderUnw = self.placeholder {
//            self.attributedPlaceholder = AttributedTextManager.getAttributedText(placeHolderUnw, font: UIFont.systemFont(ofSize: 14), color: UIColor.init(hex: hexColor))
//                //CommonFunctions.getAttributedText(placeHolderUnw, size: 14, color: UIColor.init(hex: hexColor))
//        }
//    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
