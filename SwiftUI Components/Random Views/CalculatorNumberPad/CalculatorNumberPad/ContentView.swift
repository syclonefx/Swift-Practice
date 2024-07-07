//
//  ContentView.swift
//  CalculatorNumberPad
//
//  Created by syclonefx on 7/7/24.
//  https://www.reddit.com/r/SwiftUI/comments/1dxf82x/grid/

import SwiftUI

struct ContentView: View {
  let buttonWidth: Double = 70
  
  var numberPad: [String] {
    var numbers = (1...9).map { "\($0)" }
    
    numbers.append(".")
    numbers.append("0")
    numbers.append("00")
    return numbers
  }
  
  var topRow: [String] {
    return ["AC", "+/-", "%"]
  }
  
  var operators: [String] {
    return [String("\u{00F7}"), String("\u{00D7}"), "-", "+", "="]
  }
  
  let topRowColumns = Array(
    repeating: GridItem(
      .flexible(),
      spacing: 0,
      alignment: .center),
    count: 3
  )
  
  let columns = Array(
    repeating: GridItem(
      .flexible(),
      spacing: 50,
      alignment: .center),
    count: 3
  )
  
  let operatorColumns = Array(
    repeating: GridItem(
      .flexible(),
      spacing: 0,
      alignment: .center),
    count: 1
  )
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.blue.gradient)
      HStack(alignment: .top) {
        VStack {
          ZStack {
            Capsule()
              .fill(.white.opacity(0.5))
              .frame(width: 250, height: buttonWidth)
            LazyVGrid(columns: topRowColumns) {
              ForEach(topRow, id: \.self) { item in
                Button  {
                  //
                } label: {
                  Text(item)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                }
              }
            }
          }
          
          LazyVGrid(columns: columns, spacing: 15) {
            ForEach(numberPad, id: \.self) { item in
              Button {
                //
              } label: {
                ZStack {
                  Circle()
                    .fill(.white.opacity(0.5))
                    .frame(width: buttonWidth)
                  Text(item)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                }
              }
            }
          }
        }
        ZStack{
          Capsule()
            .fill(.white.opacity(0.5))
            .frame(width: buttonWidth, height: 400)
          LazyVGrid(columns: operatorColumns, spacing: 58) {
            ForEach(operators, id: \.self) { item in
              Button  {
                //
              } label: {
                Text(item)
                  .font(.title2)
                  .fontWeight(.bold)
                  .foregroundStyle(.black)
              }
            }
          }
          .frame(width: 70)
        }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  ContentView()
}
