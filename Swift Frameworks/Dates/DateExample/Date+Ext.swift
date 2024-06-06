//
//  Date+Ext.swift
//  DateExample
//
//  Created by Chuck Perdue on 6/5/24.
//

import Foundation

extension Date {
  func toString() -> String{
    // input: 2024-04-16 00:53:49 +0000
    // output: Mon, April 15
    let dateFormatter = DateFormatter()
    //    dateFormatter.dateFormat = "E, MMMM dd"
    dateFormatter.setLocalizedDateFormatFromTemplate("EMMMMdd")
    
    return dateFormatter.string(from: self)
  }
  
  func toStringWithFormat(format: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//    dateFormatter.timeZone = .current
    
    return dateFormatter.string(from: self)
  }
  
  func dateFromString(string: String) -> Date {
    let dateFormatter = ISO8601DateFormatter()
    let date = dateFormatter.date(from: string) ?? Date.now
    //    print(dateFormatter.date(from: string)?.stringValue ?? "Empty")
    //    print("ISO TIME: " + string)
    return date
  }
}
