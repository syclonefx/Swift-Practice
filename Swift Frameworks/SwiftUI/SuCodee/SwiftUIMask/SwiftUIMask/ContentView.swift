//
//  ContentView.swift
//  SwiftUIMask
//
//  Created by Chuck Perdue on 7/17/24.
//  https://www.reddit.com/r/SwiftUI/comments/1e5haed/swiftui_mask/

import SwiftUI

struct ContentView: View {
  @State private var degrees:Double = 0
  
  let gradientColors:[Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink]
  
  var body: some View {
    VStack{
      ZStack{
        Circle()
          .stroke(lineWidth: 25)
          .frame(width: 150, height: 150)
          .foregroundStyle(.gray.opacity(0.3))
        Circle()
          .stroke(lineWidth: 25)
          .frame(width: 150, height: 150)
          .foregroundStyle(AngularGradient.init(gradient: Gradient(colors: gradientColors),center: .center))
          .mask {
            Circle()
              .trim(from: 0, to: 0.15)
              .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
              .rotationEffect(.degrees(degrees))
          }
      }
      .onAppear(){
        withAnimation(.linear(duration:2).repeatForever(autoreverses: false)) {
          degrees += 360
        }
      }
      Spacer()
    }
    .padding(.top, 20)
  }
}

#Preview {
  ContentView()
}
