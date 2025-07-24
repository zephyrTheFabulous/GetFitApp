//
//  HeaderView.swift
//  GetFitApp
//
//  Created by Anthony on 23/7/25.
//

import SwiftUI

struct HeaderView: View {
  let titleName: String

  var body: some View {
    VStack {
      Text(titleName)
        .font(.largeTitle)

      HStack {
        Image(systemName: "hand.wave")
        ForEach(1 ..< 5) { item in
          Image(systemName: "\(item).circle")
        }
      }
      .font(.title2)

    }
  }
}
#Preview(traits: .sizeThatFitsLayout) {
  HeaderView(titleName: "Jumps")
}
