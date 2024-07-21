//
//  PageView.swift
//  StepWithAnimation
//
//  Created by Chuck Perdue on 7/17/24.
//  https://www.youtube.com/watch?v=3BsNze6u6Bw

import SwiftUI

struct DataModel: Identifiable {
  var id: UUID = UUID()
  let icon: String
  let title: String
  let details: String
  let tag: Int
}

struct PageView: View {
  let cardData = [
    DataModel(icon: "paintbrush.fill", title: "Brushes", details: "Explore various brushes for different effects.", tag: 0),
    DataModel(icon: "scribble", title: "Sketch", details: "Create quick sketches and doodles.", tag: 1),
    DataModel(icon: "square.and.pencil", title: "Shapes", details: "Draw and manipulate shapes with ease.", tag: 2),
    DataModel(icon: "paintpalette.fill", title: "Colors", details: "Choose from a wide range of colors and palettes.", tag: 3),
    DataModel(icon: "sparkles", title: "Effects", details: "Apply special effects to enhance your artwork.", tag: 4),
    DataModel(icon: "hand.draw.fill", title: "Freehand", details: "Draw freehand with precision and control", tag: 5),
    DataModel(icon: "sparkles", title: "Effects", details: "Apply special effects to enhance your artwork.", tag: 6),
  ]
  
  @State var currentPage = 0
  @State var previousPage = 0
  @State var width: CGFloat = 16
  @State var start = false
  @State var iconAnimation = false
  @State var navigateToHome = false
  
  var body: some View {
    TabView(
      selection: $currentPage,
      content: {
        ForEach(cardData) { item in
          CardView(vm: item)
        }
      })
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .onChange(of: currentPage) { oldValue, newValue in
      handleChange(from: oldValue, to: newValue)
    }
    StepsView(currentPage: $currentPage, width: $width, numberOfCircles: cardData.count, circleSize: circleSize)
    ButtonsView(isLastPage: .constant(currentPage == cardData.count - 1), Start: $start, GoBack: {
      withAnimation {
        if currentPage > 0 {
          currentPage -= 1
        }
      }
    }, next: {
      withAnimation {
        if currentPage < cardData.count - 1 {
          currentPage += 1
        } else {
          // go to home
          currentPage = 0
          previousPage = 0
          width = 46
        }
      }
    })
  }
  
  func updateWidth(_ newPage: Int) {
    withAnimation {
      if newPage == 0 {
        start = false
      }
      
      if newPage > previousPage {
        start = true
        width += 30
      } else {
        width -= 30
      }
    }
  }
  
  func handleChange(from oldValue: Int, to newValue: Int) {
    updateWidth(newValue)
    previousPage = newValue
  }
  
  func circleSize(for index: Int, total: Int) -> CGFloat {
    let minCircle: CGFloat = 5
    if index < total / 2 {
      return minCircle + CGFloat(index)
    } else {
      return minCircle + CGFloat(total - index - 1)
    }
  }
}

#Preview {
  PageView()
}
