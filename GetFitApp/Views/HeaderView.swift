//
//  HeaderView.swift
//  GetFitApp
//
//  Created by Anthony on 23/7/25.
//

import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleName: String

  var body: some View {
    VStack {
      Text(titleName)
        .font(.largeTitle)

      HStack {
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          let fill = index == selectedTab ? ".fill" : ""
          Image(systemName: "\(index + 1).circle\(fill)")
            .onTapGesture {
              selectedTab = index
            }
        } // if chosen tab is the same as index, we apply .fill to SFSymbol. // selectedTab becomes the number of array element

      }
      .font(.title2)

    }
  }
}
#Preview(traits: .sizeThatFitsLayout) {
  HeaderView(selectedTab: .constant(0), titleName: "Jumps")
}
