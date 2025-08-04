//
// ContentView.swift
// ShoppingList
//
// Created by syclonefx on 7/8/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ContentView: View {
  @State private var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      Tab("Shopping Lists", systemImage: "cart", value: 0) {
        ShoppingListsView()
      }

      Tab("Products", systemImage: "cabinet", value: 1) {
        ProductListView()
      }

      Tab("Settings", systemImage: "gear", value: 2) {
        Text("Settings")
      }
    }
  }
}

#Preview {
  ContentView()
}
