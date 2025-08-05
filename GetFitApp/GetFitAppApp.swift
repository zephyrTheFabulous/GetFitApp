//
//  GetFitAppApp.swift
//  GetFitApp
//
//  Created by Anthony on 21/7/25.
//

import SwiftUI

@main
struct GetFitAppApp: App {
  @State private var historyStore = HistoryStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(historyStore)
            .alert(isPresented: $historyStore.loadingError) {
              Alert(
                title: Text("History"),
                message: Text(
                  """
                  Unfortunately we can't load your past history.
                  Email support:
                  blabla@xyz.com
                  """
              )) // alert shows up if loading error is true
            }
        }
    }
}
