  //
  //  ExerciseView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 22/7/25.
  //

import SwiftUI
import AVKit

struct ExerciseView: View {
  
  let index: Int // what is going to be shown determined by index
  
  var exercise: Exercise { // access to name from enum for HeaderView
    Exercise.exercises[index]
  }

  var body: some View {
    GeometryReader { geo in
      VStack {
        HeaderView(exerciseName: exercise.exerciseName)
          .padding(.bottom, 16)

        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geo.size.height * 0.45)

        Text("Timer")
        Text("Start/Done")
        Text("Rating")
        Text("History button")
      }
    }
  }
}

#Preview {
  ExerciseView(index: 0)
}




