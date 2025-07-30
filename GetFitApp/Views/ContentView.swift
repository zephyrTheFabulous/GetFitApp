  //
  //  ContentView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 21/7/25.
  //

import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 9 // for WelcomeView page
  
  @State private var history = HistoryStore()

  var body: some View {
      //       After refactoring
    TabView (selection: $selectedTab) {
      WelcomeView(selectedTab: $selectedTab, history: history)
        .tag(9)

      ForEach(Exercise.exercises.indices, id: \.self) { index in // .indices means "each index"
        ExerciseView(selectedTab: $selectedTab, history: $history, index: index)
          .tag(index) // each exercise is tagged with index
      }
    } //: TAB
//    .environment(HistoryStore()) // gives access of HistoryStore data model to all subviews of TabView
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
