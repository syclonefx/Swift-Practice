//
//  ContentView.swift
//  SwiftUIKeyboard
//
//  Created by Chuck Perdue on 6/1/24.
//

import SwiftUI

struct ContentView: View {
  @FocusState private var numberPadIsFocused: Bool
  
  @State private var isShowingSheet = false
  @State private var name = "Chuck"
  @State private var score: Double = 5
  
  var body: some View {
    NavigationStack {
      VStack{
        HStack {
          Text("Name")
          Spacer()
          TextField("Name", text: $name)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(.roundedBorder)
  //          .focused($isFocused)
            .frame(width: 200)
        }
        HStack{
          Text("Score")
          Spacer()
          TextField("Score", value: $score, format: .number)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .focused($numberPadIsFocused)
            .frame(width: 150)
            .toolbar {
              if numberPadIsFocused {
                ToolbarItemGroup(placement: .keyboard) {
                  Spacer()
                  
                  Button("Done") {
                    numberPadIsFocused = false
                  }
                }
              }
            }
            .onAppear {
//              numberPadIsFocused = true
            }
        }
        Button("Show Sheet") {
          isShowingSheet = true
        }
        .padding()
        .foregroundStyle(.white)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
      }
      
      Spacer()
      .sheet(isPresented: $isShowingSheet) {
        SheetView()
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
