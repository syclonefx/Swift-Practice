//
//  StateSelection.swift
//  FeedbackView
//
//  Created by Chuck Perdue on 7/17/24.
//

import SwiftUI

enum ImageResources: String, Hashable {
  case muted = "muted"
  case sad = "sad"
  case nervous = "nervous"
  case happy = "happy"
  case happy2 = "happy2"
}

struct StateSelection: View {
  @Binding var selected: ImageResources?//. = .happy
  var emoji: [ImageResources] = [.muted, .sad, .nervous, .happy, .happy2]
  
  var body: some View {
    HStack {
      ForEach(emoji, id: \.self) { item in
        Image(item.rawValue).renderingMode(.template)
          .resizable()
          .scaledToFill()
          .foregroundStyle(selected == item ? .white : .black)
          .frame(width: 32, height: 32)
          .padding(14)
          .background(
            selected == item ? .blue : .white,
            in: .rect(cornerRadius: 10)
          )
          .onTapGesture {
            selected = item
          }
      }
    }
  }
}

#Preview {
  StateSelection(selected: .constant(.happy2))
}
