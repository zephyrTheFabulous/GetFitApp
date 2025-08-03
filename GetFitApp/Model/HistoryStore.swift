//
//  HistoryStore.swift
//  GetFitApp
//
//  Created by Anthony on 25/7/25.
//

import Foundation

// Data structure to store the user's activity

struct ExerciseDay: Identifiable {
  let id = UUID()

  let date: Date
  var exercises: [String] = []
}

@Observable class HistoryStore {
  var exerciseDays: [ExerciseDay] = []

  // to exclude from release build
  init() {
    #if DEBUG
//    createDevData()
    #endif
  }

  // Add exercise on pressing "Done" button
  func addDoneExercise(_ exerciseName: String) {
    let today = Date()
    // change
//    if today.isSameDay(as: exerciseDays[0].date) {
    // to (optional check, two conditions)
    if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
      exerciseDays[0].exercises.append(exerciseName)
    } else {
      exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
    }
    // if today is the same as this date, append the current exerciseName to the exercises array of this exerciseDay
    // if today is a new day, creates a new ExerciseDay and inserts it at the beginning of the exerciseDays

    print("History: ", exerciseDays)
  }
}

// Sample data for HistoryStore. Not part of the core definition
// function that just fills in the store with sample data
extension HistoryStore {
   func createDevData() {
    exerciseDays = [
      .init( // yesterday
        date: Date().addingTimeInterval(-86400),
        exercises: [
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[2].exerciseName,
        ]
      ),
      .init( // day before yesterday
        date: Date().addingTimeInterval(-86400 * 2),
        exercises: [
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[0].exerciseName,
        ]
      )
    ]
  }
}
