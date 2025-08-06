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
  @State private var showHistory = false

  var getStartedButton: some View {
    RaisedButton(buttonText: "Get Started") {
      selectedTab = 0
    }
    .padding()
  }

  var body: some View {
    ZStack {
      VStack {
        HeaderView(selectedTab: $selectedTab, titleName: "Welcome")

          // History button
        Spacer()

        Button("History") {
          showHistory.toggle()
        }
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
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

        //MARK: - Get Started Button
        //  change
//        Button {
//          selectedTab = 0
//            //          print(URL.documentsDirectory)
//        } label: {
//          Text("Get Started")
//            .raisedButtonTextStyle()
//        }
//        .buttonStyle(.raised)
//        .padding()
        // to
        getStartedButton

      } //: VS
    } //: ZS
  }
}

#Preview {
  WelcomeView(selectedTab: .constant(9))
}
