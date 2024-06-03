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
            ForEach(viewModel.earthquakes) { content in
                SpotCellView(content: content)
            }
        }
        .refreshable { Task { await viewModel.fetch() } }
    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = FakeData.earthquakes
    return SpotListView()
        .environment(viewModel)
}
