//
//  Date+Ext.swift
//  DateExample
//
//  Created by Chuck Perdue on 6/5/24.
//

import Foundation
// https://www.hackingwithswift.com/forums/swift/calculating-first-and-last-day-of-the-month/19844

extension Date {
  
  // Date, String & Formatting
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
  
  
  static var yesterday: Date { return Date().dayBefore }
  static var tomorrow:  Date { return Date().dayAfter }
  var dayBefore: Date {
    return Calendar.current.date(byAdding: .day, value: -1, to: midnight)!
  }
  var dayAfter: Date {
    return Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
  }
  var noon: Date {
    return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
  }
  var midnight: Date {
    return Calendar.current.date(bySettingHour: 23, minute: 59, second: 0, of: self)!
  }
  var day: Int {
    return Calendar.current.component(.day,  from: self)
  }
  var month: Int {
    return Calendar.current.component(.month,  from: self)
  }
  var isLastDayOfMonth: Bool {
    return dayAfter.month != month
  }
  var startOfDay: Date {
    return Calendar.current.startOfDay(for: self)
  }
  var endOfDay: Date {
    return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
  }
  var randomTime: Date {
    let minutes = Int.random(in: 0...59)
    let hour = Int.random(in: 0...23)
    return Calendar.current.date(bySettingHour: hour, minute: minutes, second: 0, of: self)!
  }
  
  func startOfMonth() -> Date {
    return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
  }
  
  func endOfMonth() -> Date {
    return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
  }
  
  // Needed for Dashboard Chart
  func add(days: Int) -> Date {
    return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
  }
  // Needed for Dashboard Chart
  func add(months: Int) -> Date {
    return Calendar(identifier: .gregorian).date(byAdding: .month, value: months, to: self)!
  }
  
  func isMonday() -> Bool {
    // https://stackoverflow.com/a/33606288/710793
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.weekday], from: self)
    return components.weekday == 2
  }
}
