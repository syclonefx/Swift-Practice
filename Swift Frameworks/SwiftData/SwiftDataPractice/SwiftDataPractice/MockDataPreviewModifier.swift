//
// MockDataPreviewModifier.swift
// SwiftDataPractice
// 
// Created by syclonefx on 8/4/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftData
import SwiftUI

struct MockDataPreviewModifier: PreviewModifier {

  static func makeSharedContext() throws -> ModelContainer {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: User.self, configurations: config)
    let users = [
      User(name: "Steve Jobs", emailAddress: "steve@apple.com", role: .admin),
      User(name: "Tim Cook", emailAddress: "tim@apple.com", role: .admin),
      User(name: "John Appleseed", emailAddress: "john@apple.com", role: .user),
    ]

    for user in users {
      container.mainContext.insert(user)
    }

    return container
  }

  func body(content: Content, context: ModelContainer) -> some View {
    content.modelContainer(context)
  }
}
