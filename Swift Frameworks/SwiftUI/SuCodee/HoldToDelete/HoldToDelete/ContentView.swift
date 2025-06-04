//
//  ContentView.swift
//  HoldToDelete
//
//  Created by Chuck Perdue on 7/14/24.
//  https://www.reddit.com/r/SwiftUI/comments/1e30e6l/swiftui_onlongpressgesture/

import SwiftUI

struct ContentView: View {
  @State var isComplete = false
  @State var isSuccess = false
  
  var body: some View {
    VStack {
      ZStack {
        ZStack(alignment: .leading) {
          Rectangle()
            .frame(width: 250, height: 55)
            .foregroundColor(.red.opacity(0.5))
          Rectangle()
            .frame(width:isComplete ? 250 : 0, height: 55)
            .foregroundColor(isSuccess ? .gray : .red)
        }
        .clipShape(Capsule())
        Text(isSuccess ? "ACCOUNT DELETED" : "HOLD TO DELETE").bold()
      }
      .onLongPressGesture(minimumDuration: 2, maximumDistance: 50) { isPressing in
        if isPressing {
          withAnimation( .linear(duration: 2)) {
            isComplete = true
          }
        } else {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            if !isSuccess {
              withAnimation {
                isComplete = false
              }
            }
          }
        }
      } perform: {
        withAnimation {
          isSuccess = true
        }
      }
      Spacer()
    }
    .padding(.top, 40)
  }
}

#Preview {
  ContentView()
}
