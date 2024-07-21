//
//  ContentView.swift
//  ThisWeekView
//
//  Created by Chuck Perdue on 7/20/24.
//  https://www.reddit.com/r/SwiftUI/comments/1e875uj/how_would_you_do_this/

import SwiftUI

struct ContentView: View {
  
  var thisWeek: [ThisWeek] {
    var output = [ThisWeek]()
    let startOfWeek = Date().startOfWeek()
    let weekDay = ["S", "M", "T", "W", "T", "F", "S"]
    var index = 0
    
    weekDay.forEach { day in
      var currentDay = startOfWeek
      if index != 0 {
        currentDay = currentDay.addingTimeInterval(TimeInterval(86400 * index))
      }
      
      let components = Calendar.current.dateComponents([.day, .month, .year], from: currentDay)
      let dayNumber = components.day ?? 0
      let isToday = Calendar.current.isDateInToday(currentDay)
      let newDay = ThisWeek(alphaDay: day, numberDay: dayNumber, isToday: isToday)
      
      index += 1
      output.append(newDay)
    }
    
    return output
  }
  
  var body: some View {
    HStack(spacing: 10) {
      ForEach(thisWeek, id: \.self) { day in
        DayView(alphaDay: day.alphaDay, numberDay: day.numberDay, isToday: day.isToday)
      }
    }
  }
}

#Preview {
  ContentView()
}

struct DayView: View {
  var alphaDay: String
  var numberDay: Int
  var isToday: Bool
  
  var body: some View {
    VStack {
      Text(alphaDay)
        .foregroundStyle(isToday ? .blue : .black)
      ZStack {
        Circle()
          .frame(width: 40)
          .foregroundStyle(isToday ? .blue : .clear)
        Text("\(numberDay)")
          .foregroundStyle(isToday ? .white : .black)
      }
    }
  }
}

struct ThisWeek: Hashable {
  let id = UUID()
  let alphaDay: String
  let numberDay: Int
  let isToday: Bool
}

extension Calendar {
  // https://stackoverflow.com/a/35687720
  static let gregorian = Calendar(identifier: .gregorian)
}
extension Date {
  // https://stackoverflow.com/a/35687720
  func startOfWeek(using calendar: Calendar = .gregorian) -> Date {
    calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
  }
}
