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
  @State private var showHistory = false
  @State private var showSuccessPage = false

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
      if lastExercise {
        showSuccessPage.toggle()
      } else {
        selectedTab += 1
      }
    } // if it's the last exercise, opens SuccessView, otherwise scrolls to next exercise
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
            .sheet(isPresented: $showSuccessPage) {
              SuccessView(selectedTab: $selectedTab)
                .presentationDetents([.medium,.large])
            }
        }
        .font(.title3)
        .padding()

        // Rating buttons
        RatingView(rating: $rating )

        // History button
        Spacer()
        Button("History") {
          showHistory.toggle()
        }
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
      }
    }
  }
}

#Preview {
  ExerciseView(selectedTab: .constant(1), index: 1)
}




