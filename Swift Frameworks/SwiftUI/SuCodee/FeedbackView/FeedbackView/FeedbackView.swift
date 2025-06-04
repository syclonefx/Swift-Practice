//
//  FeedbackView.swift
//  FeedbackView
//
//  Created by Chuck Perdue on 7/17/24.
//

import SwiftUI

struct FeedbackView: View {
  @FocusState var focusState
  
  @State private var selected: ImageResources? = nil
  @State private var open: Bool = false
  @State private var showButtons = false
  @State private var showSend = false
  
  @Binding var text: String
  
  var sendAction: () -> Void
  
  var body: some View {
    VStack(alignment: open ? .leading : .center, spacing: 17) {
      Text("Feedback")
        .font(.title2)
        .bold()
        .foregroundStyle(.white)
      if open {
        RateExperience
        StateSelection(selected: $selected)
          .frame(maxWidth: .infinity, alignment: .center)
        TextEditorView
      }
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: open ? .topLeading : .center)
    .frame(height: open ? 350 : 60, alignment: open ? .topLeading : .center)
    .background(Color.black, in: .rect(cornerRadius: open ? 20 : 10))
    .clipped()
    .padding()
    .onTapGesture {
      withAnimation {
        open = true
      }
      if !open {
        showButtons = false
      } else {
        withAnimation(.spring.delay(0.3)) {
          showButtons = true
        }
      }
    }
    .background(
      SendAndCancel(isSend: $showSend, cancel: {
        selected = nil
        text = ""
        withAnimation {
          open = false
          showButtons = false
        }
        
      }, send: {
        sendAction()
        selected = nil
        text = ""
        withAnimation {
          open = false
          showButtons = false
        }
      })
      .offset(y: showButtons ? 250 : 0)
    )
    .onChange(of: selected) { oldValue, newValue in
      withAnimation {
        showSend = newValue != nil
      }
    }
    .onChange(of: text) { oldValue, newValue in
      withAnimation {
        showSend = newValue != ""
      }
    }
    
  }
  var RateExperience: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Rate Experience")
        .font(.title2)
      Text("How do you feel about using our app, please rate your experience.")
        .font(.footnote)
        .foregroundStyle(.secondary)
    }
    .foregroundStyle(.white)
  }
  var TextEditorView: some View {
    TextEditor(text: $text)
      .focused($focusState)
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Button {
            focusState = false
          } label: {
            Image(systemName: "keyboard.chevron.compact.down.fill")
          }
        }
      }
      .clipShape(.rect(cornerRadius: 10))
  }
}

#Preview {
  FeedbackView(text: .constant(""), sendAction: {})
}
