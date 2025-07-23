//
//  RatingView.swift
//  GetFitApp
//
//  Created by Anthony on 24/7/25.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
      HStack {
        ForEach(0 ..< 5) { _ in
          Image(systemName: "star.hexagon")
            .foregroundStyle(.gray)
            .font(.largeTitle)
        }
      }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView()
}
