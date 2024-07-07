//
//  AddUserView.swift
//  SwiftDataPractice
//
//  Created by Chuck Perdue on 5/2/24.
//

import SwiftUI

struct AddUserView: View {
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss
  
  @State private var name = ""
  @State private var emailAddress = ""
  @State private var role = UserRole.user
  
  var body: some View {
    NavigationStack {
      Form {
        HStack {
          Text("Name")
          Spacer()
          TextField("Name", text: $name)
            .multilineTextAlignment(.trailing)
        }
        
        HStack {
          Text("Email Address")
          Spacer()
          TextField("Email Address", text: $emailAddress)
            .multilineTextAlignment(.trailing)
            .textContentType(.emailAddress)
        }
        Picker("User Role", selection: $role) {
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
        
        ToolbarItem(placement: .topBarTrailing) {
          Button("Save") {
            let user = User(name: name, emailAddress: emailAddress, role: role)
            
            modelContext.insert(user)
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
  AddUserView()
}
