//
// MockData.swift
// ShoppingList
//
// Created by syclonefx on 7/8/25
// https://syclonefx.com
// https://github.com/syclonefx
//

import Foundation

struct MockData {

  static func product() -> Product {
    Product(id: 1,
            name: "Cake Mix",
            description: "Chocolate cake mix",
            upc: "000000000000",
            image: nil,
            price: 2.75,
            lastUpdated: Date())
  }

  static func products() -> [Product] {
    return [
      .init(id: 1, name: "Apple", description: "Granny Smith Apples", upc: "000000000000", image: nil, price: 2.75,lastUpdated: Date()),
      .init(id: 2, name: "Banana", description: nil, upc: "000000000000", image: nil, price: 3.75, lastUpdated: Date()),
      .init(id: 3, name: "Orange", description: nil, upc: "000000000000", image: nil, price: 4.75, lastUpdated: Date()),
      .init(id: 4, name: "Frozen Pizza", description: "DiGiorno Classic Cut Pizza", upc: "000000000000", image: nil, price: nil, lastUpdated: Date()),
      .init(id: 5, name: "Pepsi", description: "Pepsi 2 Liter Bottle", upc: nil, image: nil, price: 2.75, lastUpdated: Date()),
      .init(id: 6, name: "Doritos", description: "Nacho Cheese", upc: "000000000000", image: nil, price: 9.99, lastUpdated: Date()),
      .init(id: 7, name: "Skittles", description: "Save the Rainbows", upc: "000000000000", image: nil, price: 1.25, lastUpdated: Date()),
      .init(id: 8, name: "Carrot", description: nil, upc: "000000000000", image: nil, price: 2.50, lastUpdated: Date()),
      .init(id: 9, name: "Eggs", description: "18 count Extra Large Eggs", upc: "000000000000", image: nil, price: 12.99, lastUpdated: Date()),
    ]
  }

  static func shoppingLists() -> [ShoppingList] {
    return [
      .init(id: 1, name: "Walmart", date: Date(), isCompleted: false),
      .init(id: 2, name: "Kroger", date: Date(), isCompleted: false),
      .init(id: 3, name: "Publix", date: Date(), isCompleted: false),
    ]
  }

  static func shoppingList() -> ShoppingList {
    return .init(id: 1, name: "Walmart", date: Date(), isCompleted: false)
  }

  static func listItems() -> [ListItem] {
    return [
      .init(id: 1, shoppingListId: 1, productId: 1, quantity: 5, addedToCart: false),
      .init(id: 2, shoppingListId: 1, productId: 2, quantity: 12, addedToCart: true),
      .init(id: 3, shoppingListId: 1, productId: 3, quantity: 1, addedToCart: false),
      .init(id: 4, shoppingListId: 2, productId: 4, quantity: 1, addedToCart: false),
      .init(id: 5, shoppingListId: 2, productId: 5, quantity: 1, addedToCart: true),
      .init(id: 6, shoppingListId: 2, productId: 6, quantity: 1, addedToCart: false),
      .init(id: 7, shoppingListId: 3, productId: 7, quantity: 1, addedToCart: false),
      .init(id: 8, shoppingListId: 3, productId: 8, quantity: 1, addedToCart: true),
      .init(id: 9, shoppingListId: 3, productId: 9, quantity: 1, addedToCart: false),
    ]
  }
}
