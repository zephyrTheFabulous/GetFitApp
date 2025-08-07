//
//  ContainerView.swift
//  GetFitApp
//
//  Created by Anthony on 8/8/25.
//

import SwiftUI

struct ContainerView<Content: View>: View {
  var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View { // result of the content closure that the initializer performed
    ZStack {
      RoundedRectangle(cornerRadius: 25)
        .foregroundStyle(Color.background)
      VStack {
        Spacer()
        Rectangle()
          .frame(height: 25)
          .foregroundStyle(Color.background) // to keep sharp edges
      }
      content
    }
  }
}

#Preview {
  ContainerView { // with SAMPLE CONTENT
    VStack {
      RaisedButton(buttonText: "Hello", action: {})
        .padding(50)
      Button("Tap me!") {}
        .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
    }
  }
  .padding(50)
}
