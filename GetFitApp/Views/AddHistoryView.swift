//
//  AddHistoryView.swift
//  GetFitApp
//
//  Created by Anthony on 16/8/25.
//

import SwiftUI

struct ButtonsView: View {
//  @Environment(HistoryStore.self) private var history
  @Binding var date: Date

  var body: some View {
    HStack {
      ForEach(Exercise.exercises.indices, id: \.self) { index in
        let exerciseName = Exercise.exercises[index].exerciseName
        Button(exerciseName) {
        }
      }
    } //: HS
    .buttonStyle(EmbossedButtonStyle(buttonScale: 1.5))
  }
}

// view to create calendar view
struct AddHistoryView: View {
  @Binding var addMode: Bool
  @State private var exerciseDate = Date()

    var body: some View {
      VStack {
        ZStack {
          Text("Add Exercise")
            .font(.title)
          Button("Done") {
            addMode = false // dismiss the view
          }
          .frame(maxWidth: .infinity, alignment: .trailing)

        }
        ButtonsView(date: $exerciseDate)
        DatePicker("Choose Date", selection: $exerciseDate, in: ...Date(), displayedComponents: .date)
          .datePickerStyle(.graphical)
      } // "...Date()" to not let user select a future date
      .padding()
    }
}

#Preview {
  AddHistoryView(addMode: .constant(true))
}
