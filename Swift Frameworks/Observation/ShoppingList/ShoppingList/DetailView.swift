//
// DetailView.swift
// ShoppingList
// 
// Created by syclonefx on 7/10/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

struct DetailView: View {
  let title: String
  let value: String

  var body: some View {
    HStack {
      Text("\(title): ")
        .fontWeight(.bold)
      Text(value)
      Spacer()
    }
  }
}

#Preview {
  DetailView(title: "Hello", value: "World")
}
