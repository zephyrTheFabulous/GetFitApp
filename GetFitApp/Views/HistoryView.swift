  //
  //  HistoryView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 24/7/25.
  //

import SwiftUI

struct HistoryView: View {
  @Binding var showHistory: Bool
  @Environment(HistoryStore.self) private var history

  var body: some View {
    VStack {
      Text("History")
        .font(.title)
        .padding()

      Form {
        // Collection of days. Sample data from HistoryStore
        ForEach(history.exerciseDays) { day in
          Section {
            // EXERCISE NAME
            ForEach(day.exercises, id: \.self) { exercise in
              Text(exercise)
            }
          } header: {
            // DATE
            Text(day.date.formatted(as: "MMM d"))
              .font(.headline)
          }
        }
        // iteration over all available(in sample data) days and each day is iterated again to show exercises
        // ExerciseDay conform to Identifiable, that's why we don't need id: \.self
      }
    } //: VS
    .overlay(alignment: .topTrailing) {
      Button {
        showHistory.toggle()
      } label: {
        Image(systemName: "xmark.circle")
          .font(.title)
          .padding(16)
      }
    }
  }
}

#Preview {
  HistoryView(showHistory: .constant(true))
    .environment(HistoryStore())
}
