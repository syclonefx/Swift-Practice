//
// ListItem.swift
// ShoppingList
// 
// Created by syclonefx on 7/8/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import Foundation

struct ListItem: Identifiable, Hashable {
  let id: Int64
  let shoppingListId: Int64
  let productId: Int64
  var quantity: Int = 0
  var addedToCart: Bool = false
}
