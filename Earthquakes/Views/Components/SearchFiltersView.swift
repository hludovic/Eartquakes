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

        VStack {
            HStack {
                Label("Magnitude", systemImage: "waveform.badge.exclamationmark")
                    .padding(.top)
                Spacer()
            }
            Picker("Magnitude", systemImage: "waveform.badge.exclamationmark", selection: $viewModel.selectedStrength) {
                ForEach(SearchFilterContent.Magnitude.allCases) { Text($0.rawValue) }
            }
            .pickerStyle(.palette)
            HStack {
                Label("Date", systemImage: "calendar")
                Spacer()
            }
            .padding(.top)
            Picker("Date", systemImage: "calendar", selection: $viewModel.selectedPeriod) {
                ForEach(SearchFilterContent.Period.allCases) { Text($0.rawValue) }
            }
            .pickerStyle(.palette)
            Button(action: { Task { await viewModel.fetch() } } ) { Text("Search") }
            .buttonStyle(.bordered)
            .padding()
        }
        .frame(width: 450)
    }
}

#Preview {
    return SearchFiltersView()
        .environment(EarthquakeViewModel())
        .border(Color.black.opacity(0.2))
}
