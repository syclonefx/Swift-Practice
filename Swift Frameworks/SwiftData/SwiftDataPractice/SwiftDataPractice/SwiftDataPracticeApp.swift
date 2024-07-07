//
//  SwiftDataPracticeApp.swift
//  SwiftDataPractice
//
//  Created by Chuck Perdue on 5/2/24.
//  https://developer.apple.com/documentation/swiftdata

import SwiftData
import SwiftUI

@main
struct SwiftDataPracticeApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(for: User.self)
  }
}
