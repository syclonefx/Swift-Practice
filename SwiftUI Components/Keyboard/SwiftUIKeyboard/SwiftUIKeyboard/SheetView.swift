//
//  SheetView.swift
//  SwiftUIKeyboard
//
//  Created by Chuck Perdue on 6/1/24.
//

import SwiftUI

struct SheetView: View {
  @FocusState private var isFocused: Bool
  
  
  @State private var name = "Chuck"
  @State private var score: Double = 5
  
  var body: some View {
    NavigationStack {
      HStack {
        Text("Name")
        Spacer()
        TextField("Name", text: $name)
          .multilineTextAlignment(.trailing)
          .textFieldStyle(.roundedBorder)
          .focused($isFocused)
          .frame(width: 200)
      }
      HStack{
        Text("Score")
        Spacer()
        TextField("Score", value: $score, format: .number)
          .multilineTextAlignment(.trailing)
          .textFieldStyle(.roundedBorder)
          .keyboardType(.decimalPad)
          .focused($isFocused)
          .frame(width: 150)
          .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
              Spacer()
              
              Button("Done") {
                isFocused = false
              }
            }
          }
      }
      Spacer()
    }
    .padding()
  }
}

#Preview {
  SheetView()
}
