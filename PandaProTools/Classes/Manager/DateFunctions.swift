//
//  DateFunctions.swift
//  Подкапотом
//
//  Created by Yestay Muratov on 7/9/16.
//  Copyright © 2016 PandaMobile. All rights reserved.
//

import Foundation

public class DateFunctions{
    //for train schedule only
    public class func formatTrainDateToStringWithParameter(_ date: Date?, parameter: String, lang: String = "ru")->String
    {
        if date == nil {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        
        if lang == "ru" {
            
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        dateFormatter.dateFormat = parameter
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    
    public class func formatDateToStringWithParameter(_ date: Date?, parameter: String, lang: String = "ru")->String
    {
        if date == nil {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        if lang == "ru" {
            
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        dateFormatter.dateFormat = parameter

        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    
    public class func formatDateToStringWithParameter(_ date: Date?, lang: String = "ru")->String
    {
        if date == nil {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        if lang == "ru" {
            
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        
        let parameter = "dd-MM-yyyy HH:mm"
        dateFormatter.dateFormat = parameter
        let dateString = dateFormatter.string(from: date!)
        return dateString
        
    }
    
    public class func formatDateToStringWithParameters(_ date: Date?, _ parameter: String?, lang: String = "ru")->String
    {
        if date == nil {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        if lang == "ru" {
            
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        dateFormatter.dateFormat = parameter
        let dateString = dateFormatter.string(from: date!)
        return dateString
        
    }
    
    
    
    public class func formatStringToDateWithParameter(_ stringdate:String?, parameter: String, lang: String = "ru")-> Date?{
        
        if stringdate == nil {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = parameter
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        if lang == "ru" {
            
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        if let date = dateFormatter.date(from: stringdate!) {
            return date
        }
        return nil
    }
    
    public class func formatStringToDateWithParameter(_ stringdate:String?, lang: String = "ru")-> Date?{
        
        if stringdate == nil {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        let parameter = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        dateFormatter.dateFormat = parameter
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        if lang == "ru" {
            
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        if let date = dateFormatter.date(from: stringdate!) {
            return date
        }
        return nil
    }
    
    public class func formatStringToStringWithParameter(_ stringdate:String?, inputParams: String, outputParams: String, lang: String = "ru")-> String?{
        
        if stringdate == nil {
            return nil
        }
        
        
        let dateFormatter = DateFormatter()
        let parameter = inputParams
        dateFormatter.dateFormat = parameter
        dateFormatter.timeZone = TimeZone.current
        
        if lang == "ru" {
        
            dateFormatter.locale = Locale(identifier: "ru_RU")
        }else if lang == "kk"{
            dateFormatter.locale = Locale(identifier: "kk_KZ")
        }else {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        
        if let date = dateFormatter.date(from: stringdate!) {
            return self.formatDateToStringWithParameter(date, parameter: outputParams)
            
        }
        return nil
    }
    
    public static func getDateTimeSecondCurrent()->String{
    
        let date = Date() 
        
        return formatDateToStringWithParameter(date, parameter: "yyyy-MM-dd'T'HH:mm:ss")
    
    }
    
    public static func getCurrentWeekDayName()->String? {
     
        let date = Date()
        
        if let datename = date.dayOfWeek(){
            return datename
        }
        
        return nil
        
    }
    
    public static func getDayOfWeek()->Int? {
        
        let formatter  = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd"

        let todayDate = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate as Date)
        let weekDay = myComponents.weekday
        return weekDay
    }
    
    public static func getYearFromDate(date: Date)->Int{
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        return components.year!
    }
    
    // get week day by
    public static func getWeekDaysInEnglish() -> [String] {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        return calendar.weekdaySymbols
    }
    
    public enum SearchDirection {
        case Next
        case Previous
        
        var calendarOptions: NSCalendar.Options {
            switch self {
            case .Next:
                return .matchNextTime
            case .Previous:
                return [.searchBackwards, .matchNextTime]
            }
        }
    }
    
    public static func get(direction: SearchDirection, _ dayName: String, considerToday consider: Bool = false) -> NSDate {
        let weekdaysName = getWeekDaysInEnglish()
        
        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")
        
        let nextWeekDayIndex = weekdaysName.index(of: dayName)! + 1 // weekday is in form 1 ... 7 where as index is 0 ... 6
        
        let today = NSDate()
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        if consider && calendar.component(.weekday, from: today as Date) == nextWeekDayIndex {
            return today
        }
        
        let nextDateComponent = NSDateComponents()
        nextDateComponent.weekday = nextWeekDayIndex
        
        
        let date = calendar.nextDate(after: today as Date, matching: nextDateComponent as DateComponents, options: direction.calendarOptions)
        return date! as NSDate
    }
    
    public static func getDateByYears(_ dateString: String?) -> String? {
        if let _date = dateString, let date = _date.toDate("yyyy-MM-dd'T'HH:mm:ss") {
            
            let currentDate = Date()
            
            let components = Calendar.current.dateComponents([.year], from: date, to: currentDate)
            
            
            if let year = components.year {
                return year.toString()
            }
        }
        
        return nil
    }
    
    public static func getSinceUntilDates(_ startDate: String?, endDate: String?, params: String = "yyyy-MM-dd'T'HH:mm:ss") -> String?{
        
        if let _startDateStr = startDate, let _endDateStr = endDate, let _startDate = _startDateStr.toDate(params), let _endDate = _endDateStr.toDate(params), let convertedSTRDate =  _startDate.toString("dd.MM.yyyy"), let convertedStrEndDate = _endDate.toString("dd.MM.yyyy") {
            
            return "c \(convertedSTRDate) по \(convertedStrEndDate)"
        }
        
        return nil
    }
}


