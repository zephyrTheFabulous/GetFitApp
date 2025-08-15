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
    //  @Bindable var history: HistoryStore

  var headerView: some View {
    HStack {
      Spacer()
      Text("History")
        .font(.title)
      Spacer()
      Button {
        showHistory.toggle()
      } label: {
        Image(systemName: "xmark.circle")
      }
      .font(.title)
    }
  }

  func exerciseView(day: ExerciseDay) -> some View {
    ForEach(day.uniqueExercises, id: \.self) { exercise in
      Text(exercise)
        .badge(day.countExercise(exercise: exercise))
    }
  }

  func dayView(day: ExerciseDay) -> some View {
    Section(
      header:
        Text(day.date.formatted(as: "d MMM YYYY"))
        .font(.headline)) {
          exerciseView(day: day)
        }
  }

    //MARK: - BODY
    // change
    //  var body: some View {
    //    VStack {
    //      Text("History")
    //        .font(.title)
    //        .padding()
    //
    //      Form {
    //        // Collection of days. Sample data from HistoryStore
    //        ForEach(history.exerciseDays) { day in
    //          Section {
    //            // EXERCISE NAME
    //            ForEach(day.exercises, id: \.self) { exercise in
    //              Text(exercise)
    //            }
    //          } header: {
    //            // DATE
    //            Text(day.date.formatted(as: "MMM d"))
    //              .font(.headline)
    //          }
    //        }
    //        // iteration over all available(in sample data) days and each day is iterated again to show exercises
    //        // ExerciseDay conform to Identifiable, that's why we don't need id: \.self
    //      }
    //    } //: VS
    //    .overlay(alignment: .topTrailing) {
    //      Button {
    //        showHistory.toggle()
    //      } label: {
    //        Image(systemName: "xmark.circle")
    //          .font(.title)
    //          .padding(16)
    //      }
    //    }
    //} //: BODY

    // to
  var body: some View {
    VStack {
      headerView
        .padding()

        // change Form
        //        Form {
        //          ForEach(history.exerciseDays) { day in
        //            dayView(day: day)
        //              .swipeActions(edge: .leading, allowsFullSwipe: true) {
        //                Image(systemName: "xmark")
        //              }
        //          }
        //        }

        // to editable List
      @Bindable var history = history // Bindable needed to change Environment property
      List($history.exerciseDays, editActions: .delete) { $day in
        dayView(day: day) // List iterates through days, and dayView contain another loop that iterates through exercises
      }
    } //: VS
//    .onDisappear {
//      try? history.save()
//    }
  }
}

#Preview {
  var history = HistoryStore(preview: false)
  HistoryView(showHistory: .constant(true))
    .environment(history)
}
