//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 23/01/2024.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    @State private var viewModel = EarthquakeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
