//
//  ButtonsView.swift
//  StepWithAnimation
//
//  Created by Chuck Perdue on 7/17/24.
//

import SwiftUI

struct ButtonsView: View {
  @Binding var isLastPage: Bool
  @Binding var Start: Bool
  var GoBack: () -> Void
  var next: () -> Void
  
  var body: some View {
    HStack(spacing: Start ? 10 : 0) {
      BackButton(show: $Start, Back: {GoBack()})
      ContinueButton(isLastPage: $isLastPage, Start: { next() })
    }
    .clipShape(Capsule())
    .padding(.horizontal, 5)
  }
}

#Preview {
  ButtonsView(isLastPage: .constant(false), Start: .constant(true), GoBack: {}, next: {})
}


struct BackButton: View {
  @Binding var show: Bool
  var Back: () -> Void
  
  var body: some View {
    Button(action: { Back() }, label: {
      Image(systemName: "chevron.left")
        .font(.title2)
        .frame(width: show ? 60 : 0, height: 55)
        .background(.thinMaterial, in: Circle())
    })
    .tint(show ? .primary : .clear)
  }
}

struct ContinueButton: View {
  @Binding var isLastPage: Bool
  var Start: () -> Void
  
  var body: some View {
    Text(isLastPage ? "Finish" : "Continue")
      .font(.title2)
      .foregroundStyle(.white)
      .frame(maxWidth: .infinity)
      .frame(height: 55)
      .background(.blue, in: Capsule())
      .onTapGesture {
        Start()
      }
  }
}
