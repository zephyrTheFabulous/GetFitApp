  //
  //  SuccessView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 25/7/25.
  //

import SwiftUI

struct SuccessView: View {
  @State private var symbolAnimation = false

  var body: some View {
    ZStack {
      VStack {
        ZStack  {
          Image(systemName: "hand.thumbsup.circle")
            .foregroundStyle(.green)
          Image(systemName: "hand.thumbsup.circle")
            .foregroundStyle(.yellow)
            .offset(x: 2)
        }
        .font(.system(size: 80))
        .symbolEffect(.wiggle, options: .repeat(3) , value: symbolAnimation)
        
        Text("Great job!")
          .font(.largeTitle)
          .fontWeight(.bold)
        Text("You completed all four exercises! \nCome again tomorrow.")
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
      }
      .onAppear {
        symbolAnimation = true
      }

      VStack {
      Spacer()
        Button {
          
        } label: {
          Text("Continue")
        }
      }
    } //: MAIN ZS
  }
}

#Preview {
  SuccessView()
}
