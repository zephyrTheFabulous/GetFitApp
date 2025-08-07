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

  // change rating state
//  @State private var rating = 0
  // to UserDefaults storage
//  @AppStorage("rating") private var rating = 0
  // moved this storage to RatingView to make ratings separate for each exercise

  @State private var showHistory = false
  @State private var showSuccessPage = false
  @Environment(HistoryStore.self) private var history


    //  let interval: TimeInterval = 30 // for TimerView // changed to
  @State private var timerIsOn = true // becomes false when timer reaches zero
  @State private var showTimer = false

  let index: Int // what is going to be shown determined by index

  var exercise: Exercise { // access to name from enum for HeaderView
    Exercise.exercises[index]
  }


  // check whether this is the last exercise
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }

  // change
//  var startButton: some View {
//    Button("Start Exercise") {
//      showTimer.toggle()
//    }
//  }
  // to
  var startButton: some View {
    RaisedButton(buttonText: "Start Exercise") {
      showTimer.toggle()
    }
  }

  var doneButton: some View {
    Button("Done") {
      history.addDoneExercise(Exercise.exercises[index].exerciseName) // add exercise to array
      timerIsOn = true
      showTimer.toggle()
      if lastExercise {
        showSuccessPage.toggle()
      } else {
        selectedTab += 1
      }
    } // if it's the last exercise, opens SuccessView, otherwise scrolls to next exercise
  }

  var historyButton: some View {
    Button {
      showHistory = true
    } label: {
      Text("History")
        .fontWeight(.bold)
        .padding(.horizontal, 5)
    }
    .padding(.bottom, 10)
    .buttonStyle(.embossed)
  }

  //MARK: - BODY
  var body: some View {
    GeometryReader { geo in
      VStack {
        // Header
        HeaderView(selectedTab: $selectedTab, titleName: exercise.exerciseName)
          .padding(.bottom, 16)

        // VideoPlayer
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geo.size.height * 0.45) // 45% of screen

          // Start & Done buttons
        HStack (alignment: .center, spacing: 150)  {
          startButton
          doneButton
            .disabled(timerIsOn)
            .sheet(isPresented: $showSuccessPage) {
              SuccessView(selectedTab: $selectedTab)
                .presentationDetents([.medium,.large])
            }
        }
        .font(.title3)
        .padding()

        // Timer
        if showTimer { // TimerView appears when showTimer becomes true
          TimerView(
            timerIsOn: $timerIsOn,
            size: geo.size.height * 0.07
          )
        }

        Spacer()
        // Rating buttons
        RatingView(exerciseIndex: index )
          .padding()

        // History button
        // change
//        Button("History") {
//          showHistory.toggle()
//        }
        // to
        historyButton
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
      }
    }
  }
}

#Preview {
  ExerciseView(selectedTab: .constant(1), index: 1)
    .environment(HistoryStore())
}




