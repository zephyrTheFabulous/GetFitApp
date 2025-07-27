  //
  //  ExerciseView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 22/7/25.
  //

import SwiftUI
import AVKit

struct ExerciseView: View {
  @Binding var selectedTab: Int

  let index: Int // what is going to be shown determined by index

  var exercise: Exercise { // access to name from enum for HeaderView
    Exercise.exercises[index]
  }

  let interval: TimeInterval = 30 // for TimerView



  var body: some View {
    GeometryReader { geo in
      VStack {
        // Header
        HeaderView(titleName: exercise.exerciseName)
          .padding(.bottom, 16)

        // VideoPlayer
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geo.size.height * 0.45) // 45% of screen

        // Timer
        Text(Date().addingTimeInterval(interval),style: .timer)
          .font(.system(size: geo.size.height * 0.07)) // 7% of screen

        // Start/Done button
        Button("Start/Done") {

        }
        .font(.title3)
        .padding()

        // Rating buttons
        RatingView()

        // History button
        Spacer()
        Button("History") {

        }
      }
    }
  }
}

#Preview {
  ExerciseView(selectedTab: .constant(1), index: 1)
}




