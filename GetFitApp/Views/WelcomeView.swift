  //
  //  WelcomeView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 22/7/25.
  //

import SwiftUI

struct WelcomeView: View {
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
  WelcomeView()
}
