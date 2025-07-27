  //
  //  WelcomeView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 22/7/25.
  //

import SwiftUI

// No actions on Welcome page beside Get Started button which selects first exercise page
struct WelcomeView: View {
  @Binding var selectedTab: Int

  var body: some View {
    ZStack {
      VStack {
        HeaderView(titleName: "Welcome")

          // History button
        Spacer()
        Button("History") {

        }
      } //: VS
      VStack {
        HStack (alignment: .top)  {
          Image("running")
            .resizable()
            .scaledToFill()
            .frame(width: 240, height: 240)
            .clipShape(Circle())
          VStack(alignment: .leading) {
            Text("Get fit")
              .font(.largeTitle)
            Text("with high intensity interval training")
              .font(.headline)
          }
        } //: HS
        Button {
          selectedTab = 0
        } label: {
          Text("Get Started")
          Image(systemName: "chevron.right.circle")
        }
        .font(.title2)
        .padding()
        .background(Capsule().stroke(.gray, lineWidth: 2))
      } //: VS
    } //: ZS
  }
}

#Preview {
  WelcomeView(selectedTab: .constant(9))
}
