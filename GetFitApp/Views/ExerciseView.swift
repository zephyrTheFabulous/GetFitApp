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
  @State private var rating = 0

  let index: Int // what is going to be shown determined by index

  var exercise: Exercise { // access to name from enum for HeaderView
    Exercise.exercises[index]
  }

  let interval: TimeInterval = 30 // for TimerView

  // check whether this is the last exercise
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }

  var startButton: some View {
    Button("Start Exercise") {

    }
  }

  var doneButton: some View {
    Button("Done") {
      selectedTab = lastExercise ? 9 : selectedTab + 1
    } // if it's the last exercise, returns back to home page(WelcomeView), otherwise scrolls to next exercise
  }


  var body: some View {
    GeometryReader { geo in
      VStack {
        // Header
        HeaderView(selectedTab: $selectedTab, titleName: exercise.exerciseName)
          .padding(.bottom, 16)

        // VideoPlayer
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geo.size.height * 0.45) // 45% of screen

        // Timer
        Text(Date().addingTimeInterval(interval),style: .timer)
          .font(.system(size: geo.size.height * 0.07)) // 7% of screen

        // Start/Done button
        HStack (alignment: .center, spacing: 150)  {
          startButton
          doneButton
        }
        .font(.title3)
        .padding()

        // Rating buttons
        RatingView(rating: $rating )

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




