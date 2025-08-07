  //
  //  EmbossedButton.swift
  //  GetFitApp
  //
  //  Created by Anthony on 7/8/25.
  //

import SwiftUI

enum EmbossedButtonShape {
  case round, capsule
}

struct EmbossedButtonStyle: ButtonStyle {
  var buttonShape = EmbossedButtonShape.capsule // default is capsule

  func makeBody(configuration: Configuration) -> some View {
    let shadow = Color.dropShadow
    let highlight = Color.dropHighlight

    return configuration.label
      .padding(10)
      .background(
        GeometryReader { geo in
          shape(size: geo.size)
            .foregroundStyle(Color.background)
            .shadow(color: shadow, radius: 1, x: 2, y: 2)
            .shadow(color: highlight, radius: 1, x: -2, y: -2)
            .offset(x: -1, y: -1) // to compensate for shadow shift
        }
      )
  }

  @ViewBuilder
  func shape(size: CGSize) -> some View {
    switch buttonShape {
    case .round:
      Circle()
        .stroke(Color.background, lineWidth: 2)
        .frame(width: max(size.width, size.height), height: max(size.width, size.height))
        .offset(x: -1)
        .offset(y: -max(size.width, size.height) / 2 + min(size.width, size.height) / 2)
    case .capsule:
      Capsule()
        .stroke(Color.background, lineWidth: 2)
    }
  }
} //: EmbossedButtonStyle

  // shortening of EmbossedButton to .embossed
extension ButtonStyle where Self == EmbossedButtonStyle {
  static var embossed: EmbossedButtonStyle {
    .init(buttonShape: .round) // diameter from the height of the button
    // same as
    // EmbossedButtonStyle(buttonShape: .round)
  }
}



#Preview(traits: .sizeThatFitsLayout) {
  Button("History") {

  }
  .fontWeight(.bold)
  // change
//  .buttonStyle(.embossed)
  // to
//  .buttonStyle(EmbossedButtonStyle(buttonShape: .capsule))
  // or
  .buttonStyle(.embossed)
  .padding()
}
