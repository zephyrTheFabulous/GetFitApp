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

  var historyButton: some View {
    Button {
      showHistory = true
    } label: {
      Text("History")
        .fontWeight(.bold)
        .padding(.horizontal, 5)
    }
    .padding(.bottom, 10)
    .buttonStyle(.embossed)
  }

    //MARK: - BODY
  var body: some View {
    GeometryReader { geo in
      VStack {
        HeaderView(selectedTab: $selectedTab, titleName: "Welcome")

        ContainerView { // background
          ViewThatFits {
            VStack { // first stack to show wherever it can, but when space is tight(Dynamic Type), it will use the alternative one
              WelcomeView.images // extension
              WelcomeView.welcomeText

                //MARK: - Get Started Button
              getStartedButton
                //MARK: - History button
              Spacer()
              historyButton
            } //: VS
            VStack { // alternative stack
              WelcomeView.welcomeText

                //MARK: - Get Started Button
              getStartedButton
                //MARK: - History button
              Spacer()
              historyButton
            } //: VS
          } //: ViewThatFits
        }
        .frame(height: geo.size.height * 0.8) // container takes up to 80% of available space
      } //: main VS
      .sheet(isPresented: $showHistory) {
        HistoryView(showHistory: $showHistory)
      }
    } //: GEO
  }
}


#Preview {
  WelcomeView(selectedTab: .constant(9))
}
