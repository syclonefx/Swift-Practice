//
//  SendAndCancel.swift
//  FeedbackView
//
//  Created by Chuck Perdue on 7/17/24.
//

import SwiftUI

struct SendAndCancel: View {
  @Binding var isSend: Bool
  var cancel: () -> Void
  var send: () -> Void
  
  var body: some View {
    HStack(spacing: isSend ? 10 : 0) {
      CancelButton(isSend: $isSend, cancel: { cancel() })
      SendButton(isSend: $isSend, send: { send() })
    }
    .padding()
  }
}

#Preview {
  SendAndCancel(isSend: .constant(false), cancel: {}, send: {})
}

struct CancelButton: View {
  @Binding var isSend: Bool
  var cancel: () -> Void
  
  var body: some View {
    Button {
      cancel()
    } label: {
      Image(systemName: "xmark")
        .font(.title2)
        .frame(maxWidth: isSend ? 60 : .infinity)
        .frame(height: 60)
        .background(.black, in: .rect(cornerRadius: 15))
    }
    .tint(.white)
  }
}

struct SendButton: View {
  @Binding var isSend: Bool
  var send: () -> Void
  
  var body: some View {
    Button {
      send()
    } label: {
      Text("Submit")
        .font(.title2)
        .foregroundStyle(.white)
        .frame(maxWidth: isSend ? .infinity : 0)
        .frame(height: 60)
        .background(.blue, in: .rect(cornerRadius: 15))
    }
  }
}
