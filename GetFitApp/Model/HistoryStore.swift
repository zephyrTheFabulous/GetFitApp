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
}

// Sample data for HistoryStore. Not part of the core definition
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
