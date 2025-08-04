//
// ListItemRowView.swift
// ShoppingList
//
// Created by syclonefx on 7/10/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ListItemRowView: View {
  @Binding private var listItem: ListItem

  var product: Product

  init(listItem: Binding<ListItem>) {
    product = Product.empty()
    _listItem = listItem

    let products = MockData.products()
    if let prod = products.first(where: {$0.id == listItem.wrappedValue.productId}) {
      product = prod
    }
  }

  var body: some View {
    HStack {
      Text("^[\(listItem.quantity) \(product.name)](inflect: true)")
      Spacer()
      Toggle(isOn: $listItem.addedToCart, label: {
        Text("Added to Cart")
      })
      .labelsHidden()
    }
  }
}

#Preview {
  @Previewable @State var listItem = MockData.listItems()[0]
  ListItemRowView(listItem: $listItem)
}
