//
//  BarChartWeekView.swift
//  GetFitApp
//
//  Created by Anthony on 17/8/25.
//

import SwiftUI
import Charts

// Chart to show amount of exercises for each day in a week
struct BarChartWeekView: View {
  @Environment(HistoryStore.self) var history
  @State private var weekData: [ExerciseDay] = []

    var body: some View {
      Chart(weekData) { day in
        ForEach(Exercise.names, id: \.self) { name in
          BarMark(
  //          x: .value("Date", day.date.dayName), // show only days with exericises or
            x: .value("Date", day.date, unit: .day), // to show empty days
            y: .value("Total Count", day.countExercise(exercise: name))
          )
          .foregroundStyle(by: .value("Exercise", name))
        } // show exercises by colors

          // Line variation
//        LineMark(
//          x: .value("Date", day.date, unit: .day), // to show empty days
//          y: .value("Total Count", day.exercises.count)
//        )
//        .symbol(.circle) // corner symbol
//        .interpolationMethod(.catmullRom)

      } //: Chart
      .chartForegroundStyleScale([
        "Stretch": Color(.chartExercise1),
        "Running": Color(.chartExercise2),
        "Stairs": Color(.chartExercise3),
        "Jumping": Color(.chartExercise4)
      ])
        // limitation to first 7 elements of array
      .onAppear {
        let firstDate = history.exerciseDays.first?.date ?? Date()
        let dates = firstDate.previousSevenDays
        weekData = dates.map { date in
          history.exerciseDays.first(
            where: { $0.date.isSameDay(as: date)
            }) ?? ExerciseDay(date: date)
        }
      } // array of last 7 days, including empty days
    }
}

#Preview {
  BarChartWeekView()
    .environment(HistoryStore(preview: true))
}
