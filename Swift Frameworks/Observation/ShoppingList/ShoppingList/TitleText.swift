//
// TitleText.swift
// ShoppingList
// 
// Created by syclonefx on 7/16/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

struct TitleText: View {
  var text: String = ""

  init(_ text: String) {
    self.text = text
  }

  var body: some View {
    Text(text.uppercased())
      .frame(width: 125, alignment: .leading)
  }
}
