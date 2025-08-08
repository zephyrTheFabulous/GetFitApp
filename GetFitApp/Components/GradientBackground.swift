  //
  //  GradientBackground.swift
  //  GetFitApp
  //
  //  Created by Anthony on 8/8/25.
  //

import SwiftUI

struct GradientBackground: View {
    // change
//  var gradient: Gradient {
//    Gradient(
//      colors: [
//        .gradientTop,
//        .gradientBottom,
//        .background,
//      ]
//    )
//  }
  // to (to have stops)
  var gradient: Gradient {
    let color1 = Color.gradientTop
    let color2 = Color.gradientBottom
    let color3 = Color.background
    return Gradient(
      stops: [
        Gradient.Stop(color: color1, location: 0),
        Gradient.Stop(color: color2, location: 0.2),
        Gradient.Stop(color: color3, location: 0.8),
//        Gradient.Stop(color: color3, location: 1),
      ]
    )
  }

  var body: some View {
    LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
      .ignoresSafeArea()
  }
}

#Preview {
  GradientBackground()
}
