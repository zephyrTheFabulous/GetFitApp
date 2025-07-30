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

 struct HistoryStore {
  var exerciseDays: [ExerciseDay] = []

  // to exclude from release build
  init() {
    #if DEBUG
    createDevData()
    #endif
  }

  // Add exercise on pressing "Done" button
  mutating func addDoneExercise(_ exerciseName: String) {
    let today = Date()
    if today.isSameDay(as: exerciseDays[0].date) {
      exerciseDays[0].exercises.append(exerciseName)
    } else {
      exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
    }
    // if today is the same as this date, append the current exerciseName to the exercises array of this exerciseDay
    // if today is a new day, creates a new ExerciseDay and inserts exercise at the beginning of the exerciseDays

      // "if" condition is the same as:
      // if Date().yearMonthDay == exerciseDays[0].date.yearMonthDay {
  }
}

// Sample data for HistoryStore. Not part of the core definition
// function that just fills in the store with sample data
extension HistoryStore {
   mutating func createDevData() {
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
