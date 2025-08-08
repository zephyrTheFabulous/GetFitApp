//
//  WelcomeImages.swift
//  GetFitApp
//
//  Created by Anthony on 8/8/25.
//

import SwiftUI

extension WelcomeView {
  static var images: some View {
    ZStack {
      Image(.running)
        .resizable()
        .scaledToFill()
        .frame(width: 180)
        .clipShape(Circle())
        .offset(x: -94)
      Image(.wrist)
        .resizable()
        .scaledToFit()
        .frame(width: 130)
        .clipShape(Circle())
        .offset(x: 50, y: -60)
      Image(.push3)
        .resizable()
        .scaledToFit()
        .frame(width: 120)
        .clipShape(Circle())
        .offset(x: 135, y: 0)
      Image(.run)
        .resizable()
        .scaledToFit()
        .frame(width: 50)
        .clipShape(Circle())
        .offset(x: 70, y: 50)
      Image(.torso)
        .resizable()
        .scaledToFit()
        .frame(width: 70)
        .clipShape(Circle())
        .offset(x: 30, y: 100)
    } //: ZS
    .frame(maxWidth: .infinity, maxHeight: 220)
    .shadow(color: .dropShadow, radius: 6, x: 5, y: 5)
    .padding(.vertical, 10)
    .padding(.leading, 20)
  }

  static var welcomeText: some View {
    return HStack (alignment: .bottom) {
      VStack (alignment: .leading) {
        Text("Get fit")
          .font(.largeTitle)
          .fontWeight(.black)
          .kerning(2)
        Text("with high intensity interval training")
          .font(.headline)
          .fontWeight(.medium)
          .kerning(2)
      }
    }
  }
}

#Preview {
  VStack {
    WelcomeView.images
    WelcomeView.welcomeText
  }
}
