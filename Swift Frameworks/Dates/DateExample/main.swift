//
//  main.swift
//  DateExample
//
//  Created by Chuck Perdue on 6/5/24.
//

import Foundation

let strDate = "04/13/2024 12:00:00 AM"
let drawDate = strDate.convertToDateWithFormat(format: "YYYY_MM_dd") ?? Date.now

print("Date(): \(Date())")
print("drawDate: \(drawDate)")
print("drawDate.toString(): \(drawDate.toString())")
print("drawDate.toStringWithFormat(YYYY_MM_dd): \(drawDate.toStringWithFormat(format: "YYYY_MM_dd"))")
let date = Date().dateFromString(string: strDate)
print("date: \(date)")
