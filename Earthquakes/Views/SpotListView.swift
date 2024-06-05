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
        List {
            Section {
                ForEach(viewModel.earthquakes) { content in
                    NavigationLink {
                        Text("Content")
                    } label: {
                        SpotCellView(content: content)
                    }
                }
            } header: {
                SearchFiltersView()
                    .environment(viewModel)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Earthquakes")
        .navigationBarTitleDisplayMode(.inline)
        .refreshable { Task { await viewModel.fetch() } }
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
