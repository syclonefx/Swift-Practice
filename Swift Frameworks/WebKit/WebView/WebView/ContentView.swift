//
//  ContentView.swift
//  WebView
//
//  Created by Chuck Perdue on 6/5/24.
//

import SwiftUI
import WebKit

struct ContentView: View {
  let htmlContent: String = """
      <!DOCTYPE html>
      <html lang="en">
      <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Hello, World!</title>
      <style>
      span { color: red }
      </style>
      </head>
      
      <body>
      <h1>This is an <span>HTML</span> string</h1>
      <h2>Hello, World</h2>
      <h3>iOS 26 Beta 1</h3>
      <p>This is a how you can use WebKit in your SwiftUI project</p>
      <img src="https://syclonefx.com/swift/swiftui_logo.jpg" alt="SwiftUI logo" style="width: 250px; height: auto;">
      </body>
      </html>
      """
  @State private var page = WebPage()

  var body: some View {
    NavigationStack {
      WebView(page)
        .navigationTitle(page.title)
      Spacer()
    }
    .onAppear {
      page.load(html: htmlContent, baseURL: URL(string: "about:blank")!)
    }
  }
}

//#Preview {
//  ContentView()
//}
