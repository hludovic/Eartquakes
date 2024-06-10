//
//  SpotListView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 19/02/2024.
//

import SwiftUI

struct SpotListView: View {
    @Environment(EarthquakeViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel

        List {
            Section {
                if viewModel.earthquakes.isEmpty {
                    EmptyResultView()
                } else {
                    ForEach(viewModel.earthquakes) { content in
                        Button(action: {viewModel.buttonLocationPresed(earthquake: content)}) {
                            SpotCellView(content: content)
                        }
                    }
                }
            } header: {
                if viewModel.searchButtonActivated {
                    SearchFiltersView()
                        .environment(viewModel)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Earthquakes")
        .navigationBarTitleDisplayMode(.inline)
        .refreshable { Task { await viewModel.fetch() } }
        .toolbar(content: {
            ToolbarItem(placement: .automatic) {
                Toggle("Search", systemImage: "text.magnifyingglass", isOn: $viewModel.searchButtonActivated.animation())
            }
        })
        Text("\(viewModel.bottomListCountString)")

    }
}

#Preview {
    NavigationStack {
        let viewModel = EarthquakeViewModel()
        viewModel.earthquakes = FakeData.earthquakes
        return SpotListView()
            .environment(viewModel)
    }
}
