//
//  RatingView.swift
//  GetFitApp
//
//  Created by Anthony on 24/7/25.
//

import SwiftUI

struct RatingView: View {
  // move storage from ExerciseView, to RatingView. Change
//  @Binding var rating: Int
  // to
  let exerciseIndex: Int
  @AppStorage("ratings") private var ratings = "" // separate rating storage for each exercise
  @State private var rating = 0

  let maximumRating = 5

  let onColor = Color.red
  let offColor = Color.gray

  func updateRating(index: Int) {
    rating = index
    let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
    ratings.replaceSubrange(index...index, with: String(rating))
  }

  // safe mechanism to avoid going over the range
  // ratings must have as many characters as exercises
  init(exerciseIndex: Int) {
    self.exerciseIndex = exerciseIndex
    let desiredLength = Exercise.exercises.count
    if ratings.count < desiredLength {
      ratings = ratings.padding(
        toLength: desiredLength,
        withPad: "0",
        startingAt: 0
      )
    }
  }

  fileprivate func convertRating() {
    let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex) // exercise index choses which storage to use for rating
    let character = ratings[index]
    rating = character.wholeNumberValue ?? 0
  }
  
  var body: some View {
      HStack {
        ForEach(1 ..< maximumRating + 1, id: \.self) { index in
          Image(systemName: "star.hexagon")
            .foregroundStyle(index > rating ? offColor : onColor)
            .onTapGesture {
              // replace this
//               rating = index
              // with
              updateRating(index: index)
            }
            .onAppear {
              convertRating()
            }
            .onChange(of: ratings) { _, _ in
              convertRating()
            }
        }
        .font(.largeTitle)
      }
    }
}

// temporary @AppStorage
#Preview(traits: .sizeThatFitsLayout) {
  @Previewable @AppStorage("ratings") var ratings: String?
  ratings = nil
  return RatingView(exerciseIndex: 0)
}
