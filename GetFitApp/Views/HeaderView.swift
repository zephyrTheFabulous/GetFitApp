//
//  HeaderView.swift
//  GetFitApp
//
//  Created by Anthony on 23/7/25.
//

import SwiftUI

struct HeaderView: View {
  let exerciseName: String

  var body: some View {
    VStack {
      Text(exerciseName)
        .font(.largeTitle)

      HStack {
        ForEach(1 ..< 5) { item in
          Image(systemName: "\(item).circle")
        }
      }
      .font(.title2)

    }
  }
}
#Preview(traits: .sizeThatFitsLayout) {
  HeaderView(exerciseName: "Jumps")
}
