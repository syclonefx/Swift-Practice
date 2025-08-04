//
// View+Ext.swift
// ShoppingList
// 
// Created by syclonefx on 7/16/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

extension View {
  func getSize(size: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geo in
        Color.clear
          .preference(key: ViewPreferenceKey.self, value: geo.size)
      }
    )
    .onPreferenceChange(ViewPreferenceKey.self, perform: size)
  }
}

struct ViewPreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
