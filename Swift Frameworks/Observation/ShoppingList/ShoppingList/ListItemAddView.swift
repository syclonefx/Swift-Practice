//
// ListItemAddView.swift
// ShoppingList
//
// Created by syclonefx on 7/10/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ListItemAddView: View {

  @State var selectedProduct: Product = .empty()
  @State var quantity: String = ""
  @State var description: String = ""
  @State var showingProductPicker: Bool = false

  var shoppingList: ShoppingList
  var products: [Product] = MockData.products()
  var sortedProducts: [Product] {
    products.sorted { $0.name < $1.name }
  }

  var body: some View {
    Form {
      HStack(alignment: .firstTextBaseline) {
        TitleText("Quantity")
        TextField("Quantity", text: $quantity)
          .keyboardType(.numberPad)
      }

      HStack(alignment: .firstTextBaseline) {
        TitleText("Product")
        if selectedProduct.name == "" {
          Button("Select a product") {
            withAnimation {
              showingProductPicker.toggle()
            }
          }
        } else {
          HStack {
            Text(selectedProduct.name)
            Spacer()
            Button {
              withAnimation {
                showingProductPicker.toggle()
              }
            } label: {
              Label(
                "Select a product",
                systemImage: "pencil"
              )
            }
            .labelStyle(.iconOnly)
          }
        }
      }
      .drawingGroup()

      if showingProductPicker {
        Picker("Select a product", selection: $selectedProduct, content: {
          ForEach(sortedProducts, id: \.self) { product in
            Text(product.name)
          }
        })
        .pickerStyle(.wheel)
        .animation(.easeInOut, value: showingProductPicker)
      }

      HStack(alignment: .firstTextBaseline) {
        TitleText("Description")
        TextField("Description", text: $description)
      }
      .onChange(of: selectedProduct) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          getDescription()
          withAnimation {
            showingProductPicker = false
          }
        }
      }
    }
    Button {
      // Add item
    } label: {
      Label("Add Item", systemImage: "plus.circle")
    }
    .disabled(selectedProduct.name.isEmpty)
  }

  func addItem() {
    if let quantityInt = Int(quantity) {
      ListItem(id: -1, shoppingListId: shoppingList.id!, productId: selectedProduct.id, quantity: quantityInt)
    }

  }

  func getDescription() {
    if let desc = selectedProduct.description {
      description = desc
    } else {
      description = ""
    }
  }
}

#Preview {
  ListItemAddView(shoppingList: MockData.shoppingList())
}
