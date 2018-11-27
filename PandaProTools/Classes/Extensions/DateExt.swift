//
//  DateExt.swift
//  BIPartners
//
//  Created by Yestay Muratov on 10/9/17.
//  Copyright © 2017 PandaMobile. All rights reserved.
//

import Foundation

extension Date {
    
    public func toString(_ parameter: String = "yyyy-MM-dd'T'HH:mm:ss")->String?{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let parameter = parameter
        dateFormatter.dateFormat = parameter
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    public func getWeekDay()->Int{
        let weekday = Calendar.current.component(.weekday, from: self)
        return weekday
    }
    
    func dayOfWeek(_ lang: String = "ru") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        if lang == "ru" {
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        return dateFormatter.string(from: self).capitalized
    }
}
