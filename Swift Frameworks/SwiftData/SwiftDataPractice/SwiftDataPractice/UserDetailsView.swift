//
//  UserDetailsView.swift
//  SwiftDataPractice
//
//  Created by Chuck Perdue on 5/2/24.
//

import SwiftData
import SwiftUI

struct UserDetailsView: View {
  @Environment(\.modelContext) var modelContext
  
  @State private var isShowingEditUser: Bool = false
  
  @State var user: User
  var userImage: String {
    switch user.role {
    case .admin:
      return "person.badge.key"
    case .user:
      return "person"
    case .mod:
      return "person.badge.shield.checkmark"
    }
  }
  
  var body: some View {
    HStack {
      Image(systemName: userImage)
        .resizable()
        .scaledToFit()
        .frame(width: 70)
      VStack(alignment: .leading) {
        Text(user.name)
        Text(user.emailAddress)
        Text(user.role.title)
      }
      .navigationTitle(user.name)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Edit User") {
            isShowingEditUser = true
          }
        }
      }
      Spacer()
        .sheet(isPresented: $isShowingEditUser, content: {
          EditUserView(user: $user)
        })
    }
    .padding()
    Spacer()
  }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: User.self, configurations: config)
    let example = User(name: "Steve Jobs", emailAddress: "steve@apple.com", role: .admin)
    return NavigationStack {
      UserDetailsView(user: example)
        .modelContainer(container)
    }
  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }
}
