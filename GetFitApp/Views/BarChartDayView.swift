//
//  BarChartDayView.swift
//  GetFitApp
//
//  Created by Anthony on 17/8/25.
//

import SwiftUI
import Charts

struct BarChartDayView: View {
  let day: ExerciseDay

    var body: some View {
      Chart {
        ForEach(Exercise.names, id: \.self) { name in
          BarMark(
            x: .value(name, name),
            y: .value("Total Count", day.countExercise(exercise: name))
          )
          .foregroundStyle(.historyBar)
        }

        RuleMark(y: .value("Exercise", 1))
          .foregroundStyle(.red)
      }
      .padding()
    }
}

#Preview {
  var history = HistoryStore()
  BarChartDayView(day: history.exerciseDays[0])
//    .environment(history)
}
