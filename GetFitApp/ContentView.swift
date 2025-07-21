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
          Text("Welcome")
        }
        Tab ("Exercise 1", systemImage: "1.circle") {
          Text("Exercise 1")
        }
        Tab ("Exercise 2", systemImage: "2.circle") {
          Text("Exercise 2")
        }
      }
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))


    }
}

#Preview {
    ContentView()
}
