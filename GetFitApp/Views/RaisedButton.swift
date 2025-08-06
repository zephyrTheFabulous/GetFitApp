//
//  RaisedButton.swift
//  GetFitApp
//
//  Created by Anthony on 7/8/25.
//

import SwiftUI

// change
//struct RaisedButton: View {
//    var body: some View {
//      Button {
//
//      } label: {
//        Text("Get Started")
//          .raisedButtonTextStyle()
//      }
//    }
//}
// to
struct RaisedButton: View {
  let buttonText: String
  let action: () -> Void

  var body: some View {
    Button {
      action()
    } label: {
      Text(buttonText)
        .raisedButtonTextStyle()
    }
    .buttonStyle(.raised)
  }
}

extension Text {
  func raisedButtonTextStyle() -> some View {
    self
      .font(.body)
      .fontWeight(.bold)
  }
}

// main design of button
struct RaisedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding(.vertical, 12)
      .background(
        Capsule()
          .foregroundStyle(Color.background)
          .shadow(color: .dropShadow, radius: 4, x: 6, y: 6)
          .shadow(color: .dropHighlight, radius: 4, x: -6, y: -6)
      )
  }
}

// shortening of RaisedButtonStyle to .raised
extension ButtonStyle where Self == RaisedButtonStyle {
  static var raised: RaisedButtonStyle {
    .init()
  }
}

#Preview(traits: .sizeThatFitsLayout) {
    ZStack {
      RaisedButton(buttonText: "Get Started") {
        print("Go Go!")
      }
        .padding(20)
    }
    .background(Color("background"))
    .buttonStyle(.raised)
}
