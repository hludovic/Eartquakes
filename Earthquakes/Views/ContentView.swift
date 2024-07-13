//
//  ContentView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(EarthquakeViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel

        NavigationSplitView {
            EarthquakesView()
        } detail: {
            MapView()
                .navigationBarTitleDisplayMode(.inline)
                .inspector(isPresented: $viewModel.isShowingInspector){
                    InspectorView(earthquake: viewModel.selectedCell)
                }
                .toolbar {
                    Button {  viewModel.isShowingInspector.toggle() } label: {
                        Label("Inspector", systemImage: "info.circle")
                    }
                    .disabled(viewModel.isInspectorDisabled)
                }
        }
        .alert(isPresented: $viewModel.isShowingError, error: viewModel.error) { error in
            if case let .tooManyResult(result: result) = error {
                Button("Display the first \(Constants.resultLimit) results.") {
                    viewModel.displayEarthquakes(result: result, range: .first)
                }
                Button("Display the last \(Constants.resultLimit) results.") {
                    viewModel.displayEarthquakes(result: result, range: .last)
                }
                Button("CANCEL", role: .cancel) {}
            } else {
                Button("OK") { viewModel.isShowingError = false }
            }
        } message: { error in
            Text(error.failureReason)
        }
        .overlay { if viewModel.isLoading { LoadingView() } }
    }
}

#Preview {
    ContentView()
        .environment(EarthquakeViewModel(mockEarthquakes: Earthquake.mock))
}
