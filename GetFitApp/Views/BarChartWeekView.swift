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
      Chart(history.exerciseDays.prefix(7)) { day in
        BarMark(
          x: .value("Date", day.date.dayName), // show only days with exericises or
//          x: .value("Date", day.date, unit: .day), // to show empty days
          y: .value("Total Count", day.exercises.count)
        )
      } //: Chart
        // limitation to first 7 elements of array
    }
}

#Preview {
  BarChartWeekView()
    .environment(HistoryStore())
}
