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

  // 1. fix repeated exercises in one day by converting them into set and then back to sorted array
  var uniqueExercises: [String] {
    Array(Set(exercises)).sorted(by: <)
  }

  // 2. show repeated exercises in one day as accumulated number in .badge
  func countExercise(exercise: String) -> Int {
    exercises.filter { $0 == exercise }.count
  }
}

@Observable class HistoryStore {
  var exerciseDays: [ExerciseDay] = []
  var loadingError = false // show alert when it's true

  enum FileError: Error {
    case loadFailure
    case saveFailure
  }

  var dataURL: URL {
    URL.documentsDirectory
      .appendingPathComponent("history.plist")
  }

  init(preview: Bool = false) {
#if DEBUG
    if preview {
      createDevData() // fixed Sample data
//      createHistoryTestData() // randomized Sample data
    } else {
      do {
        try load()
      } catch {
        loadingError = true
      }
    }
#endif
  }

  func load() throws { // method that raises an error
//    throw FileError.loadFailure

    guard let data = try? Data(contentsOf: dataURL) else {
      return
    } // check if history.plist exists on first run, and jump out of the method if condition is not met. Meaning, ignore loading method altogether if there is nothing to load.

    do {
//      let data = try Data(contentsOf: dataURL) // instead of hard load, we use guard ^

      let plistData = try PropertyListSerialization.propertyList(
        from: data,
        options: [],
        format: nil
      )
      let convertedPlistData = plistData as? [[Any]] ?? []
      exerciseDays = convertedPlistData.map {
        ExerciseDay(
          date: $0[1] as? Date ?? Date(),
          exercises: $0[2] as? [String] ?? []
        )
      }
    } catch {
      throw FileError.loadFailure
    }
  } //: LOAD

  func save() throws {
    let plistData = exerciseDays.map {
      [
        $0.id.uuidString, // $0 because it's just one input parameter
        $0.date,
        $0.exercises
      ]
    } // same converting functionality as for loop before

    do {
      let data = try PropertyListSerialization.data(
        fromPropertyList: plistData,
        format: .binary,
        options: .zero
      ) // convert history data to plist format
      try data.write(to: dataURL, options: .atomic)
    } catch {
      throw FileError.saveFailure
    }
  } //: SAVE
    // basically copying into new plist content what is already in exerciseDays


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
    print("Initializing HistoryStore")

    do {
      try save()
    } catch {
      fatalError(error.localizedDescription)
    }
  }
} //: HistoryStore

// Sample data for HistoryStore. Not part of the core definition
// function that just fills in the store with sample data
extension HistoryStore {
   func createDevData() {
    exerciseDays = [
      ExerciseDay(
        date: Date().addingTimeInterval(-86400),
        exercises: [
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[2].exerciseName,
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[0].exerciseName
        ]),
      ExerciseDay(
        date: Date().addingTimeInterval(-86400 * 3),
        exercises: [
          Exercise.exercises[2].exerciseName,
          Exercise.exercises[2].exerciseName,
          Exercise.exercises[3].exerciseName
        ]),
      ExerciseDay(
        date: Date().addingTimeInterval(-86400 * 4),
        exercises: [
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[1].exerciseName
        ]),
      ExerciseDay(
        date: Date().addingTimeInterval(-86400 * 5),
        exercises: [
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[3].exerciseName,
          Exercise.exercises[3].exerciseName
        ])
    ]
  }

    // This method creates random test data.
  func createHistoryTestData() {
    print("Data construction started")
    exerciseDays = []
    let numberOfDays: Int = 4
    for day in 0..<numberOfDays {
      guard let date =
              Calendar.current.date(byAdding: .day, value: -day, to: Date())
      else {
        continue
      }
      var exerciseNames: [String] = []
        // repeat a random number of times (max 6) (max 24 exercises)
      for _ in 0..<Int.random(in: 0...4) {
        for exercise in Exercise.exercises {
          if Bool.random() {
            exerciseNames.append(exercise.exerciseName)
          }
        }
      }
      if !exerciseNames.isEmpty {
        exerciseDays.append(ExerciseDay(date: date, exercises: exerciseNames))
      }
    }
    try? save()
    print("Data construction completed")
  }
}
