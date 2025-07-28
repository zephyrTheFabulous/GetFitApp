//
//  TimerView.swift
//  GetFitApp
//
//  Created by Anthony on 28/7/25.
//

import SwiftUI

struct CountdownView: View {
  let date: Date
  @Binding var timeRemaining: Int
  let size: Double

  var body: some View {
    Text("\(timeRemaining)")
      .font(.system(size: size, design: .rounded))
      .padding()
      .onChange(of: date) { _, _ in
        timeRemaining -= 1
      }
  }
}

struct TimerView: View {
  @State private var timeRemaining: Int = 3 // test time
  @Binding var timerIsOn: Bool
  let size: Double

    var body: some View {
      TimelineView(.animation(
        minimumInterval: 1.0, // update every second
        paused: timeRemaining <= 0)) { context in
          CountdownView(
            date: context.date,
            timeRemaining: $timeRemaining,
            size: size)
        }
        .onChange(of: timeRemaining) { _, _ in
          if timeRemaining < 1 {
            timerIsOn = false
          }
        }

        // works the same? doesn't work
      // Everything that is not "oldValue" is considered as "newValue"
//        .onChange(of: timeRemaining) { oldValue, newValue in
//          timerDone = newValue == 0 ? false:true
//        }
    }
}

#Preview {
  TimerView(timerIsOn: .constant(false), size: 90)
}
