//
//  Tab.swift
//  CustomTabBar
//
//  Created by Chuck Perdue on 7/22/24.
//

import SwiftUI

/// App Tabs
enum Tab: String, CaseIterable {
  case home = "Home"
  case services = "Services"
  case partners = "Partners"
  case activity = "Activity"
  
  var systemImage: String {
    switch self {
      case .home:
        return "house"
      case .services:
        return "envelope.open.badge.clock"
      case .partners:
        return "hand.raised"
      case .activity:
        return "bell"
    }
  }
  
  var index: Int {
    return Tab.allCases.firstIndex(of: self) ?? 0
  }
}
