  //
  //  ContentView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 21/7/25.
  //

import SwiftUI

struct ContentView: View {
  var body: some View {
    
      //       After refactoring
    TabView {
      ForEach(Exercise.exercises.indices, id: \.self) { index in // .indices means "each index"
        ExerciseView(index: index)
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}

#Preview {
  ZStack {
    Color.teal.ignoresSafeArea()
    ContentView()
  }
}

//#Preview("Variation") {
//  ZStack {
//    Color.teal.ignoresSafeArea()
//    TabViewStyleVariation()
//  }
//}
