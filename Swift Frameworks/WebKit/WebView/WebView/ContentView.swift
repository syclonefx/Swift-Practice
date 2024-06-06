//
//  ContentView.swift
//  WebView
//
//  Created by Chuck Perdue on 6/5/24.
//

import SwiftUI
import WebKit

struct HTMLStringView: UIViewRepresentable {
  let htmlContent: String
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(htmlContent, baseURL: nil)
  }
}

struct ContentView: View {
  var body: some View {
    VStack {
      Text("Testing HTML Content")
      Spacer()
      HTMLStringView(htmlContent: "<h1>This is <span style=\"color:red\">HTML</span> string</h1><p>Hello</p>")
      Spacer()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}


