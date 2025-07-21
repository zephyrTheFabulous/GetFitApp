//
//  ExerciseView.swift
//  GetFitApp
//
//  Created by Anthony on 22/7/25.
//

import SwiftUI

struct ExerciseView: View {
  let videoNames = ["stretch", "run", "stairs", "jump"]
  let exerciseNames = ["Stretching", "Running", "Stairs", "Jumps"]
  let index: Int // what is going to be shown determined by index

    var body: some View {
        Text(exerciseNames[index])
    }
}

#Preview {
  ExerciseView(index: 0)
}
