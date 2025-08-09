  //
  //  ContentView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 21/7/25.
  //

import SwiftUI

struct ContentView: View {
    // change
//  @State private var selectedTab = 9 // for WelcomeView page
    // to
  @SceneStorage("selectedTab") private var selectedTab = 9 // to persist scene state

  //MARK: - BODY
  var body: some View {

      ZStack {
        GradientBackground()
        //       After refactoring
      TabView (selection: $selectedTab) {
        WelcomeView(selectedTab: $selectedTab)
          .tag(9)

        ForEach(Exercise.exercises.indices, id: \.self) { index in // .indices means "each index"
          ExerciseView(selectedTab: $selectedTab, index: index)
            .tag(index) // each exercise is tagged with index
        }
      } //: TAB
//      .environment(HistoryStore()) // gives access to HistoryStore to all subviews of TabView
      .tabViewStyle(.page(indexDisplayMode: .never))
      } //: ZStack
  } //: body
}

#Preview {
//  ZStack {
//    Color.teal.opacity(0.25).ignoresSafeArea()
    ContentView()
//    .environment(HistoryStore()) // delete later and activate @SceneStorage instead of @State
//  }
}

  //#Preview("Variation") {
  //  ZStack {
  //    Color.teal.ignoresSafeArea()
  //    TabViewStyleVariation()
  //  }
  //}
