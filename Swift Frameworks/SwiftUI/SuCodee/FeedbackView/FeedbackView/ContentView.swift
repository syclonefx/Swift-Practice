//
//  ContentView.swift
//  FeedbackView
//
//  Created by Chuck Perdue on 7/17/24.
//  https://www.youtube.com/watch?v=-o6gUUdPCA4

import SwiftUI

struct ContentView: View {
  @State private var text = ""
  var body: some View {
    FeedbackView(text: $text, sendAction: {})
    Spacer()
  }
}

#Preview {
  ContentView()
}
