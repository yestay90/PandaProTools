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
        
        self.rightViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.rightView = imageView
        self.rightView?.tintColor = tintColor
    }
    
    func setImageOnLeftSide(image: UIImage){
        
        self.rightViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.leftViewMode = UITextFieldViewMode.always
        self.leftView = imageView
        self.rightView?.tintColor = .white
    }
    
    func setAttibutedPlaceholder(text: String, textColor: UIColor = .black){
        self.attributedPlaceholder = AttributedTextManager.getAttributedText(text, font: UIFont.systemFont(ofSize: 14), color: textColor)
        // CommonFunctions.getAttributedText(text, size: 14, color: textColor)
    }
    
    func setColorToAttibutedPlaceholder(hexColor: String){
        if let placeHolderUnw = self.placeholder {
            self.attributedPlaceholder = AttributedTextManager.getAttributedText(placeHolderUnw, font: UIFont.systemFont(ofSize: 14), color: UIColor.init(hex: hexColor))
                //CommonFunctions.getAttributedText(placeHolderUnw, size: 14, color: UIColor.init(hex: hexColor))
        }
    }
    
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
