//
// ProductView.swift
// ShoppingList
//
// Created by syclonefx on 7/9/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ProductView: View {

  @State private var showingProductEditView: Bool = false
  @State var product: Product

  var body: some View {
    VStack(alignment: .leading) {
      DetailView(title: "Product", value: product.name)
      if let description = product.description, !description.isEmpty {
        DetailView(title: "Description", value: description)
      }

      if let price = product.price {
        DetailView(title: "Price", value: price.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD")))
      }

      DetailView(title: "Barcode", value: product.upc ?? "")
    }
    .padding()
    .navigationTitle(product.name)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button {
          showingProductEditView = true
        } label: {
          Text("Edit")
        }
        .sheet(isPresented: $showingProductEditView, onDismiss: {
          // TODO: - Update product from database
        }, content: {
          ProductEditView(product: $product)
        })
      }
    }

    if let image = product.image {
      Image(image)
        .resizable()
        .scaledToFit()
        .containerRelativeFrame(.horizontal){ length, _ in length / 2}
    } else {
      Image(systemName: "photo.badge.plus")
        .resizable()
        .scaledToFit()
        .containerRelativeFrame(.horizontal){ length, _ in length / 2}
    }

    Spacer()
  }
}

#Preview {
  ProductView(product: MockData.product())
}
