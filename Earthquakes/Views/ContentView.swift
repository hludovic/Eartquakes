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
        .alert(isPresented: $viewModel.isShowingError, error: viewModel.error) { error in
            Button("OK") {
                viewModel.isShowingError = false
            }
        } message: { error in
            Text(error.failureReason)
        }

    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = Earthquake.mock
    return ContentView(viewModel: viewModel)
}
