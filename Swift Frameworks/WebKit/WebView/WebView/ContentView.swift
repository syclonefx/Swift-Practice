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
      HTMLStringView(htmlContent:
      """
      <!DOCTYPE html>
      <html lang="en">
      <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Hello, World</title>
      <style>
      span { color: red }
      </style>
      </head>
      
      <body>
      <h1>This is <span>HTML</span> string</h1>
      <h2>Hello, World</h2>
      <h3>iOS 18.5</h3>
      <p>This is a how you can use WebKit in your SwiftUI project</p>
      <img src="https://syclonefx.com/swift/swiftui_logo.jpg" alt="SwiftI logo" style="width: 250px; height: auto;">
      </body>
      </html>
      """)
      Spacer()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}


