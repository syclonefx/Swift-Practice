//
//  TabShape.swift
//  CustomTabBar
//
//  Created by Chuck Perdue on 7/22/24.
//

import SwiftUI

struct TabShape: Shape {
  var midPoint: CGFloat
  
  /// Adding shape animation
  var animatableData: CGFloat {
    get { midPoint }
    set { midPoint = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    return Path { path in
      /// First drawing the Rectangle shape
      path.addPath(Rectangle().path(in: rect))
      /// Now drawing upward curve shape
      path.move(to: .init(x: midPoint - 60, y: 0))
      
      let to = CGPoint(x: midPoint, y: -25)
      let control1 = CGPoint(x: midPoint - 25, y: 0)
      let control2 = CGPoint(x: midPoint - 25, y: -25)
      
      path.addCurve(to: to, control1: control1, control2: control2)
      
      let to1 = CGPoint(x: midPoint + 60, y: 0)
      let control3 = CGPoint(x: midPoint + 25, y: -25)
      let control4 = CGPoint(x: midPoint + 25, y: 0)
      
      path.addCurve(to: to1, control1: control3, control2: control4)
    }
  }
}

