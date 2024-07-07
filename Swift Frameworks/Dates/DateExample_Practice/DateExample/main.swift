//
//  main.swift
//  DateExample
//
//  Created by Chuck Perdue on 6/5/24.
//

import Foundation

let today = Date()
print("today: \(today.formatted())")

print("dayBefore: \(today.dayBefore.formatted())")
print("dayAfter: \(today.dayAfter.formatted())")
print("noon: \(today.noon.formatted())")
print("midnight: \(today.midnight.formatted())")
print("day: \(today.day.formatted())")
print("month: \(today.month.formatted())")
print("startOfDay: \(today.startOfDay.formatted())")
print("endOfDay: \(today.endOfDay.formatted())")
print("random: \(today.randomTime.formatted())")
print("random: \(today.randomTime.formatted())")
print("startOfMonth: \(today.startOfMonth().formatted())")
print("endOfMonth: \(today.endOfMonth().formatted())")

print("6 months ago from startOfMonth: \(today.endOfMonth().add(months: -5).formatted())")


