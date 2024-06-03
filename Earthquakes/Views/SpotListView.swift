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
        VStack {
            SearchFiltersView()
                .padding(.top)

            List {

                ForEach(viewModel.earthquakes) { content in
                    SpotCellView(content: content)
                }
            }
            .listStyle(.plain)
            .refreshable { Task { await viewModel.fetch() } }
        }
        .navigationTitle("Earthquakes")
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
