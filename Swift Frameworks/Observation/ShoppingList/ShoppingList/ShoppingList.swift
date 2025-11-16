//
// ShoppingList.swift
// ShoppingList
// 
// Created by syclonefx on 7/8/25
// https://syclonefx.com
// https://github.com/syclonefx
// 

import Foundation

struct ShoppingList: Identifiable {
  let id: Int64?
  var name: String
  var date: Date
  var isCompleted: Bool
  var total: Decimal?
}

// cart
// cart.badge.plus
// cart.badge.minus
// basket
