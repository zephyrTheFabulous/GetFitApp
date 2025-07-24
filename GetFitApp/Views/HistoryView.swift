  //
  //  HistoryView.swift
  //  GetFitApp
  //
  //  Created by Anthony on 24/7/25.
  //

import SwiftUI

struct HistoryView: View {
  let today = Date()
  let yesterday = Date().addingTimeInterval(-86400)

    // sample data for 2 days
  let exercises1 = ["Stretch", "Run", "Stairs", "Jumps"]
  let exercises2 = ["Stretch", "Run", "Stairs"]


  var body: some View {
    VStack {
      Text("History")
        .font(.title)
        .padding()

      Form {
        // Collection of days. Sample data
        Section {
          ForEach(exercises1, id: \.self) { each in
            Text(each)
          }
        } header: {
          Text(today.formatted(as: "MMM d"))
            .font(.headline)
        }
        Section {
          ForEach(exercises2, id: \.self) { each in
            Text(each)
          }
        } header: {
          Text(yesterday.formatted(as: "MMM d"))
            .font(.headline)
        }
      }
    }
  }
}

#Preview {
  HistoryView()
}
