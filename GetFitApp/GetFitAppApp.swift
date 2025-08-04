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
        }
    }
}
