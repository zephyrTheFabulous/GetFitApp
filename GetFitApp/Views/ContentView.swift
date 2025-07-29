  //
  //  ContentView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 21/7/25.
  //

import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 9 // for WelcomeView page

  var body: some View {
      //       After refactoring
    TabView (selection: $selectedTab) {
      WelcomeView(selectedTab: $selectedTab)
        .tag(9)

      ForEach(Exercise.exercises.indices, id: \.self) { index in // .indices means "each index"
        ExerciseView(selectedTab: $selectedTab, index: index)
          .tag(index) // each exercise is tagged with index
      }
    } //: TAB
    .environment(HistoryStore()) // gives access to HistoryStore to all subviews of TabView
    .tabViewStyle(.page(indexDisplayMode: .never))

  }
}

#Preview {
  ZStack {
    Color.teal.opacity(0.25).ignoresSafeArea()
    ContentView()
  }
}

  //#Preview("Variation") {
  //  ZStack {
  //    Color.teal.ignoresSafeArea()
  //    TabViewStyleVariation()
  //  }
  //}
