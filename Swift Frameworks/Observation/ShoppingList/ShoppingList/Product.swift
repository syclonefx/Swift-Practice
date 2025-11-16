//
// Product.swift
// ShoppingList
// 
// Created by syclonefx on 7/8/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import Foundation

struct Product: Identifiable, Hashable {
  let id: Int64
  var name: String
  var description: String?
  var upc: String?
  var image: String? // photo.badge.plus
  var price: Decimal?
  var lastUpdated: Date


  static func empty() -> Product {
    Product(id: 0,
            name: "",
            description: nil,
            upc: nil,
            image: nil,
            price: nil,
            lastUpdated: Date())
  }
}

// frying.pan
// refrigerator
