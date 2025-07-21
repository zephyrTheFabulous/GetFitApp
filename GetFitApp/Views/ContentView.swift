  //
  //  ContentView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 21/7/25.
  //

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Tab ("Welcome", systemImage: "hand.wave") {
        WelcomeView()
      }
      
      ForEach(0 ..< 4) { index in
        Tab ("Exercise 1", systemImage: "\(index+1).circle") {
          ExerciseView(index: index)
        }
      }
    }
    .tabViewStyle(.page)
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    
    
  }
}

#Preview {
  ContentView()
}
