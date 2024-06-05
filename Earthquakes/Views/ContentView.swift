//
//  ContentView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = EarthquakeViewModel()

    var body: some View {
        NavigationSplitView {
            SpotListView()
                .environment(viewModel)
        } detail: {
            MapView()
                .environment(viewModel)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = FakeData.earthquakes
    return ContentView(viewModel: viewModel)
}
