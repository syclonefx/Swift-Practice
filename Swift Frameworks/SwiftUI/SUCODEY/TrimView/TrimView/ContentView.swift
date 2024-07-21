//
//  ContentView.swift
//  TrimView
//
//  Created by Chuck Perdue on 7/17/24.
//  https://www.reddit.com/r/SwiftUI/comments/1e3t8pi/swiftui_trim/

import SwiftUI

struct ContentView: View {
  @State var Progress: CGFloat = 0
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .frame(width: 200, height: 230)
        .foregroundStyle(.gray.opacity(0.3))
      RoundedRectangle(cornerRadius: 20)
        .trim(from: 0.5 - Progress / 2, to: 0.5 + Progress / 2)
        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
        .frame(width: 227, height: 197)
        .rotationEffect(.degrees(90))
      
    }
    .onTapGesture {
      withAnimation(.linear(duration: 2)) {
        if Progress == 1.0  {
         Progress = 0
        } else {
          Progress = 1.0
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
