//
//  SearchFiltersView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 03/06/2024.
//

import SwiftUI

struct SearchFiltersView: View {
    @Environment(EarthquakeViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel

        HStack {
            Menu("Magnitude", systemImage: "waveform.badge.exclamationmark") {
                ForEach(SearchFilterContent.Magnitude.allCases) { item in
                    Button(action: {viewModel.selectedStrength = item}) {
                        if viewModel.selectedStrength == item {
                            Label(item.rawValue, systemImage: "checkmark")
                        } else {
                            Text(item.rawValue)
                        }
                    }
                    .disabled(false)
                }
            }
            Menu("Date", systemImage: "calendar") {
                ForEach(SearchFilterContent.Period.allCases) { item in
                    Button(action: {viewModel.selectedPeriod = item}) {
                        if viewModel.selectedPeriod == item {
                            Label(item.rawValue, systemImage: "checkmark")
                        } else {
                            Text(item.rawValue)
                        }
                    }
                    .disabled(false)
                }
            }
            Spacer()
            Button(action: { viewModel.earthquakes.reverse() } ) {
                Label("Invert List", systemImage: "arrow.up.arrow.down")
                    .labelStyle(.iconOnly)
            }
            Button(action: { Task { await viewModel.fetch() } } ) {
                Label("Search", systemImage: "text.magnifyingglass")
                    .labelStyle(.iconOnly)
            }
        }
    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = FakeData.earthquakes
    return SearchFiltersView()
        .environment(viewModel)
}
