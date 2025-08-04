//
// ProductEditView.swift
// ShoppingList
//
// Created by syclonefx on 7/9/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ProductEditView: View {

  @Binding var product: Product

  @State private var id: Int64
  @State private var name: String
  @State private var description: String
  @State private var price: Double
  @State private var upc: String
  @State private var image: String

  init(product: Binding<Product>) {
    _product = product

    // Initialize the state properties
    let initialProduct = product.wrappedValue
    id = initialProduct.id
    name = initialProduct.name
    description = initialProduct.description ?? ""
    price = (initialProduct.price as NSDecimalNumber?)?.doubleValue ?? 0
    upc = initialProduct.upc ?? ""
    image = initialProduct.image ?? ""
  }

  var body: some View {
    VStack {
      TextField("Name", text: $name)
      TextField("Description", text: $description)
      TextField("Bar Code", text: $upc)
      TextField("Price", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        .keyboardType(.decimalPad)
    }
    .textFieldStyle(.roundedBorder)
    .padding()
    Spacer()
  }
}

#Preview {
  @Previewable @State var product = MockData.product()
  ProductEditView(product: $product)
}
