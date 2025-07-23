//
//  VideoPlayerView.swift
//  GetFitApp
//
//  Created by Anthony on 24/7/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  let videoName: String

  var body: some View {
    VStack {
      if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
        VideoPlayer(player: AVPlayer(url: url))
      } else {
        ContentUnavailableView("Couldn't find \(videoName).mp4", systemImage: "xmark.rectangle")
          .foregroundStyle(.red)
      }
    }
  }
}

#Preview {
  VideoPlayerView(videoName: "jump")
}
