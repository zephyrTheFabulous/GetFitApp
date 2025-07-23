//
//  Exercise.swift
//  GetFitApp
//
//  Created by Anthony on 23/7/25.
//

import Foundation

struct Exercise {
  let exerciseName: String
  let videoName: String

  enum ExerciseEnum: String { // for exerciseName autocompletion
    case stretch = "Stretch"
    case run = "Running"
    case stairs = "Stairs"
    case jump = "Jumping"
  }
}

extension Exercise {
  static let exercises = [ // type property(exercises) belongs to the type(Exercise)
    Exercise(
      exerciseName: ExerciseEnum.stretch.rawValue,
      videoName: "stretch"
    ),
    Exercise(
      exerciseName: ExerciseEnum.run.rawValue,
      videoName: "run"
    ),
    Exercise(
      exerciseName: ExerciseEnum.stairs.rawValue,
      videoName: "stairs"
    ),
    Exercise(
      exerciseName: ExerciseEnum.jump.rawValue,
      videoName: "jump"
    )
  ]
}
