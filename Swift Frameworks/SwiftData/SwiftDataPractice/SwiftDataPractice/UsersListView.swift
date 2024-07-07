//
//  UsersListView.swift
//  SwiftDataPractice
//
//  Created by Chuck Perdue on 5/2/24.
//

import SwiftData
import SwiftUI

struct UsersListView: View {
  @Environment(\.modelContext) var modelContext
  
  @Query var users: [User]
  @State private var isShowingAddUser = false
  
  var body: some View {
    if users.count < 1 {
      ContentUnavailableView{
        Label("No Users", systemImage: "person.slash")
      } description: {
        Text("Add a User")
      } actions: {
        Button("Add User") {
          isShowingAddUser = true
        }
        .buttonStyle(.borderedProminent)
      }
    } else {
      List {
        ForEach(users) { user in
          NavigationLink(value: user) {
            Text(user.name)
          }
        }
        .onDelete(perform: deleteUser)
      }
      .navigationDestination(for: User.self, destination: { user in
        UserDetailsView(user: user)
      })
    }
    Spacer()
      .navigationTitle("Users")
      .toolbar {
        Button("Add User", systemImage: "plus") {
          isShowingAddUser = true
        }
        .tint(.primary)
      }
      .sheet(isPresented: $isShowingAddUser, content: {
        AddUserView()
      })
  }
  func deleteUser(at offsets: IndexSet) {
    for offset in offsets {
      let user = users[offset]
      modelContext.delete(user)
    }
  }
}

#Preview {
  NavigationStack {
    UsersListView()
  }
}
