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

        Group {
            if viewModel.earthquakes.isEmpty {
                EmptyResultView()
            } else {
                List(selection: $viewModel.selectedCell) {
                    ForEach(viewModel.filterdEarthquakes) { content in
                        SpotCellView(content: content)
                            .tag(content.id)
                    }
                }
                .tint(.gray.opacity(0.3))
                .listStyle(.insetGrouped)
                .refreshable { await viewModel.fetch() }
            }
        }
        .navigationTitle("Earthquakes")
        .searchable(text: $viewModel.textSearch, prompt: "Filter...")
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button("Search", systemImage: "line.3.horizontal.decrease.circle") {
                    viewModel.isShowingSearchFilter = true
                }
                .popover(isPresented: $viewModel.isShowingSearchFilter) {
                    SearchFiltersView()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        return SpotListView()
            .environment(EarthquakeViewModel(mockEarthquakes: Earthquake.mock))
    }
}
