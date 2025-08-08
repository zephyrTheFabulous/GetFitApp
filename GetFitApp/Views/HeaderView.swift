  //
  //  HeaderView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 23/7/25.
  //

import SwiftUI

  // HeaderView substitutes for TabView page indicators
struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleName: String

  var body: some View {
    VStack {
      Text(titleName)
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.white)

      HStack {
          // change SFSymbol
          //        ForEach(Exercise.exercises.indices, id: \.self) { index in
          //          let fill = index == selectedTab ? ".fill" : ""
          //          Image(systemName: "\(index + 1).circle\(fill)")
          //            .onTapGesture {
          //              selectedTab = index
          //            }
          //        } // if chosen tab is the same as index, we apply .fill to SFSymbol. // selectedTab becomes the number of array element

          // to circles and Circle overlay if chosen
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          ZStack {
            Circle()
              .frame(width: 32)
              .foregroundStyle(.white)
              .opacity(index == selectedTab ? 0.5 : 0.0)
            Circle()
              .frame(width: 16)
              .foregroundStyle(.white)
          }
          .onTapGesture {
            selectedTab = index
          }
        }
      } //: main HS
      .font(.title2)

    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  HeaderView(selectedTab: .constant(0), titleName: "Jumps")
    .background(GradientBackground())
}
