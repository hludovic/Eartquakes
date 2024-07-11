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
                    Spacer()
                    Button {  viewModel.isShowingInspector.toggle() } label: {
                        Label("Inspector", systemImage: "info.circle")
                    }
                    .disabled(viewModel.isInspectorDisabled)
                }
        }
        .alert(isPresented: $viewModel.isShowingError, error: viewModel.error) { error in
            Button("OK") { viewModel.isShowingError = false }
        } message: { error in
            Text(error.failureReason)
        }
    }
}

#Preview {
    return ContentView()
        .environment(EarthquakeViewModel(mockEarthquakes: Earthquake.mock))
}
