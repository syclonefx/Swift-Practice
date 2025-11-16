//
// ShoppingListView.swift
// ShoppingList
// 
// Created by syclonefx on 7/10/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

struct ShoppingListView: View {
  @State var shoppingList: ShoppingList
  @State private var listItems: [ListItem] = []
  @State private var products: [Product] = []
  @State private var showingEdit: Bool = false
  @State private var showingAddListItem: Bool = false

  init(shoppingList: ShoppingList) {
    self.shoppingList = shoppingList
    let li = MockData.listItems().map { $0.shoppingListId == shoppingList.id ? $0 : nil }
    let prod = li.map { item in
      MockData.products().first(where: { $0.id == item?.productId })
    }
    _listItems = State(wrappedValue: li.compactMap(\.self))
    _products = State(wrappedValue: prod.compactMap(\.self))
  }

  var body: some View {
    VStack {
      List($listItems, id: \.self) { item in
        ListItemRowView(listItem: item)
      }
      .listStyle(PlainListStyle())
      Spacer()
    }
    .padding()
    .navigationTitle(shoppingList.name)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          showingAddListItem.toggle()
        } label: {
          Label("Add Item", systemImage: "plus")
        }
      }
    }
    .sheet(isPresented: $showingAddListItem, content: { ListItemAddView(shoppingList: shoppingList) })
  }
}

#Preview {
  ShoppingListView(shoppingList: MockData.shoppingList())
}
