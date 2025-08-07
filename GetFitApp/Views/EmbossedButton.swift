  //
  //  EmbossedButton.swift
  //  GetFitApp
  //
  //  Created by Anthony on 7/8/25.
  //

import SwiftUI

struct EmbossedButtonStyle: ButtonStyle {
  
  func makeBody(configuration: Configuration) -> some View {
    let shadow = Color.dropShadow
    let highlight = Color.dropHighlight
    
    return configuration.label
      .padding(10)
      .background(
        shape()
          .foregroundStyle(Color.background)
          .shadow(color: shadow, radius: 1, x: 2, y: 2)
          .shadow(color: highlight, radius: 1, x: -2, y: -2)
          .offset(x: -1, y: -1) // to compensate for shadow shift
      )
  }
  
  func shape() -> some View {
    Capsule()
      .stroke(Color.background, lineWidth: 2)
  }
}


  // shortening of EmbossedButton to .embossed
extension ButtonStyle where Self == EmbossedButtonStyle {
  static var embossed: EmbossedButtonStyle {
    .init()
  }
}



#Preview(traits: .sizeThatFitsLayout) {
  Button("History") {
    
  }
  .fontWeight(.bold)
  .buttonStyle(.embossed)
  .padding()
}
