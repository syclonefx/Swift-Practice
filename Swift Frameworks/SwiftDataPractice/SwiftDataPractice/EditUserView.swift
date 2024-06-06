//
//  EditUserView.swift
//  SwiftDataPractice
//
//  Created by Chuck Perdue on 5/2/24.
//

import SwiftData
import SwiftUI

struct EditUserView: View {
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss
  
  @Binding var user: User
  
  var body: some View {
    NavigationStack {
      Form {
        HStack {
          Text("Name")
          Spacer()
          TextField("Name", text: $user.name)
            .multilineTextAlignment(.trailing)
        }
        
        HStack {
          Text("Email Address")
          Spacer()
          TextField("Email Address", text: $user.emailAddress)
            .multilineTextAlignment(.trailing)
            .textContentType(.emailAddress)
        }
        Picker("User Role", selection: $user.role) {
          ForEach(UserRole.allCases) {
            Text($0.title)
          }
        }
      }
      .navigationTitle("Add User")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: User.self, configurations: config)
    let example = User(name: "Steve Jobs", emailAddress: "steve@apple.com", role: .admin)
    
    return EditUserView(user: .constant(example))
      .modelContainer(container)
  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }
  
}
