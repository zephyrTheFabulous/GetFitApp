//
//  AddHistoryView.swift
//  GetFitApp
//
//  Created by Anthony on 16/8/25.
//

import SwiftUI

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
        DatePicker("Choose Date", selection: $exerciseDate, in: ...Date(), displayedComponents: .date)
          .datePickerStyle(.graphical)
      } // "...Date()" to not let user select a future date
      .padding()
    }
}

#Preview {
  AddHistoryView(addMode: .constant(true))
}
