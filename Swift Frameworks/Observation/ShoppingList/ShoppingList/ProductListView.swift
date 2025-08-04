//
// ProductListView.swift
// ShoppingList
//
// Created by syclonefx on 7/9/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ProductListView: View {
  var products: [Product] = MockData.products()

  var body: some View {
    NavigationStack {
      List(products) { product in
        NavigationLink(destination: ProductView(product: product)) {
          Text(product.name)
        }
      }
      .listStyle(PlainListStyle())
      .navigationBarTitle("Products")
    }
  }
}

#Preview {
  ProductListView()
}
