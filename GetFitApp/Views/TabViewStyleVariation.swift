//
//  TabViewStyleVariation.swift
//  GetFitApp
//
//  Created by Anthony on 23/7/25.
//

import SwiftUI

struct TabViewStyleVariation: View {
  @Binding var selectedTab: Int

    var body: some View {
//         variation with using SF Symbols for page indices
              TabView {
                ForEach(Array(Exercise.exercises.indices.enumerated()), id: \.element) { number, index  in
                  Tab ("Exercise 1", systemImage: "\(number+1).circle") {
                    ExerciseView(selectedTab: $selectedTab, index: index)
                  }
                }
              }
              .tabViewStyle(.page)
    }
}

#Preview {
  TabViewStyleVariation(selectedTab: .constant(0))
}
