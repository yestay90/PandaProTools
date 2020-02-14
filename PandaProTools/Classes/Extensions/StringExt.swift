//
//  StringExt.swift
//  BIPartners
//
//  Created by Yestay Muratov on 10/9/17.
//  Copyright © 2017 PandaMobile. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(_ parameter: String = "yyyy-MM-dd'T'HH:mm:ss")->Date?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = parameter
        dateFormatter.locale = Locale(identifier: "ru_RU")
        if let date = dateFormatter.date(from: self) {
            return date
        }
        return nil
    }
    
    func getFrameForString(font: UIFont)-> CGSize {
        
        let fontAttribute = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttribute)  // for Single Line
        return size;
    }
    
    func toInt()->Int? {
        return Int(self)
    }
    
    func toDouble()->Double?{
        return Double(self)
    }
    
    func addingPercentEncodingForURLQueryValue() -> String? {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
//        var allowed = CharacterSet.urlQueryAllowed
//        allowed.remove(charactersIn: generalDelimitersToEncode + subDelimitersToEncode)
        let customAllowedSet = NSCharacterSet(charactersIn: generalDelimitersToEncode + subDelimitersToEncode).inverted
        
        
        return addingPercentEncoding(withAllowedCharacters: customAllowedSet)
    }
    
    func addingPercentEncodingForURLHostValue() -> String? {
//        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
//        let subDelimitersToEncode = "!$&'()*+,;="
        
        //        var allowed = CharacterSet.urlQueryAllowed
        //        allowed.remove(charactersIn: generalDelimitersToEncode + subDelimitersToEncode)
//        let customAllowedSet = NSCharacterSet(charactersIn: generalDelimitersToEncode + subDelimitersToEncode).inverted
        
        
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
    func heightOfText(width: CGFloat, font: UIFont)->CGRect{
        
        let size = CGSize(width: width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: font], context: nil)
        return estimatedFrame
    }
}
