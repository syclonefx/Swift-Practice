//
//  User.swift
//  SwiftDataPractice
//
//  Created by Chuck Perdue on 5/2/24.
//

import Foundation
import SwiftData

enum UserRole: Codable, CaseIterable, Identifiable {
  case user, mod, admin
  var id: Self { self }
  
  var title: String {
    switch self {
    case .user:
      return "User"
    case .mod:
      return "Moderator"
    case .admin:
      return "Administrator"
    }
  }
}

@Model
class User {
  let id: UUID = UUID()
  var name: String
  var emailAddress: String
  var role: UserRole = UserRole.user
  var addedDate: Date
  
  init(name: String, emailAddress: String) {
    self.name = name
    self.emailAddress = emailAddress
    self.addedDate = Date.now
  }
  
  init(name: String, emailAddress: String, role: UserRole) {
    self.name = name
    self.emailAddress = emailAddress
    self.role = role
    self.addedDate = Date.now
  }
}
