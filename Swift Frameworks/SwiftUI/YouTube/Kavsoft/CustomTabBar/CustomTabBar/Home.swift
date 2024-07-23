//
//  Home.swift
//  CustomTabBar
//
//  Created by Chuck Perdue on 7/22/24.
//

import SwiftUI

struct Home: View {
  /// View Properties
  @State private var activeTab: Tab = .home
  /// For smooth shape sliding effect, we are going to use Match Geometry effect
  @Namespace private var animation
  @State private var tabShapePosition: CGPoint = .zero
  
  init() {
    /// Hiding tab bar due to SwiftUI iOS 16 bus
    UITabBar.appearance().isHidden = true
  }
  
  var body: some View {
    VStack(spacing: 0) {
      TabView(selection: $activeTab){
        Text("Home")
          .tag(Tab.home)
          /// Hiding Native Tab Bar
//          .toolbar(.hidden, for: .tabBar)
        
        Text("Services")
          .tag(Tab.services)
          /// Hiding Native Tab Bar
//          .toolbar(.hidden, for: .tabBar)
        
        Text("Partners")
          .tag(Tab.partners)
          /// Hiding Native Tab Bar
//          .toolbar(.hidden, for: .tabBar)
        
        Text("Activity")
          .tag(Tab.activity)
          /// Hiding Native Tab Bar
//          .toolbar(.hidden, for: .tabBar)
        
      }
      
      CustomTabBar()
    }
  }
  
  /// Custom Tab Bar
  ///  With more easy customization
  @ViewBuilder
  func CustomTabBar(_ tint: Color  = Color("Blue"), _ interactiveTint: Color = .blue) -> some View {
    /// Moving all the reaming tab items to the bottom
    HStack(alignment: .bottom, spacing: 0) {
      ForEach(Tab.allCases, id: \.rawValue) {
        TabItem(
          tint: tint,
          interactiveTint: interactiveTint,
          tab: $0,
          animation: animation,
          activeTab: $activeTab,
          position: $tabShapePosition
        )
      }
    }
    .padding(.horizontal, 15)
    .padding(.vertical, 10)
    .background(content: {
      TabShape(midPoint: tabShapePosition.x)
        .fill(.white)
        .ignoresSafeArea()
        /// Adding blur + shadow
        /// For shape smoothening
        .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
        .blur(radius: 2)
        .padding(.top, 25)
    })
    /// Adding animation
    .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
  }
}

/// Tab Bar Item
struct TabItem: View {
  var tint: Color
  var interactiveTint: Color
  var tab: Tab
  var animation: Namespace.ID
  @Binding var activeTab: Tab
  @Binding var position: CGPoint
  
  /// Each tab position on the screen
  @State private var tabPosition: CGPoint = .zero
  
  var body: some View {
    VStack(spacing: 5){
      Image(systemName: tab.systemImage)
        .font(.title2)
        .foregroundStyle(activeTab == tab ? .white : interactiveTint)
        /// Increasing the size of the active tab
        .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
        .background {
          if activeTab == tab {
            Circle()
              .fill(tint.gradient)
              .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
          }
        }
      
      Text(tab.rawValue)
        .font(.caption)
        .foregroundStyle(activeTab == tab ? tint : .gray)
    }
    .frame(maxWidth: .infinity)
    .contentShape(Rectangle())
    .viewPosition(completion: { rect in
      tabPosition.x = rect.midX
      
      /// Updating active tab position
      if activeTab == tab {
        position.x = rect.midX
      }
    })
    .onTapGesture {
      activeTab = tab
      
      withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
        position.x = tabPosition.x
      }
    }
  }
}

#Preview {
  ContentView()
}
