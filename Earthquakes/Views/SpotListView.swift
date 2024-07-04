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
                ForEach(viewModel.filterdEarthquakes) { content in
                    Button(action: {viewModel.buttonLocationPresed(earthquake: content)}) {
                        SpotCellView(content: content)
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
        .if(viewModel.canFetch()) { view in
            view.refreshable { await viewModel.fetch() }
        }
        .searchable(text: $viewModel.textSearch, prompt: "Text")
//        .toolbar {
//            ToolbarItem(placement: .automatic) {
//                Toggle("Search", systemImage: "text.magnifyingglass", isOn: $viewModel.searchButtonActivated.animation())
//            }
//        }
        Text("\(viewModel.bottomListCountString)")

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
