//
//  CustomAttibutedText.swift
//  BIPartners
//
//  Created by Yestay Muratov on 9/22/17.
//  Copyright © 2017 PandaMobile. All rights reserved.
//

import Foundation

public class AttributedTextManager {
    public class func getAttributedText(_ string: String, font: UIFont, color: UIColor)->NSAttributedString{
        let attrubutes = [NSAttributedStringKey.font : font, NSAttributedStringKey.foregroundColor: color]
        
        let nsatrributed = NSAttributedString(string: string, attributes: attrubutes)
        return nsatrributed
    }
}
