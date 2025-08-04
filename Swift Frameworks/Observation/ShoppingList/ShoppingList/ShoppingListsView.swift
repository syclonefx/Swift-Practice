//
// ShoppingListsView.swift
// ShoppingList
//
// Created by syclonefx on 7/10/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ShoppingListsView: View {

  var shoppingLists: [ShoppingList] = MockData.shoppingLists()

  var body: some View {
    NavigationStack {
        List(shoppingLists) { shoppingList in
          NavigationLink(shoppingList.name) {
            ShoppingListView(shoppingList: shoppingList)
          }
      }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Shopping Lists")
    }
  }
}

#Preview {
  ShoppingListsView()
}
