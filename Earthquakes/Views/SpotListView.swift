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
                List(selection: $viewModel.selectedEarthquake) {
                    ForEach(viewModel.filterdEarthquakes) { content in
                        SpotCellView(content: content)
                            .tag(content.id)
                            .listRowBackground(content.id == viewModel.selectedEarthquake ? Color.secondary.opacity(0.3) : nil)
                    }
                }
                .listStyle(.plain)
                .refreshable { await viewModel.fetch() }
            }
        }
        .navigationTitle("Earthquakes")
        .searchable(text: $viewModel.textSearch, prompt: "Search...")
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
        Text(viewModel.bottomListCountString)
    }
}

#Preview {
    NavigationStack {
        let viewModel = EarthquakeViewModel()
        viewModel.earthquakes = Earthquake.mock
        return SpotListView()
            .environment(viewModel)
    }
}
