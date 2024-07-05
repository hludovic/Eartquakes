//
//  SearchFiltersView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 03/06/2024.
//

import SwiftUI

struct SearchFiltersView: View {
    @Environment(EarthquakeViewModel.self) private var viewModel
    //    @State var selectedMagnitude: SearchFilterContent.Magnitude = .overMag1

    var body: some View {
        @Bindable var viewModel = viewModel

        VStack {
            HStack {
                Label("Magnitude", systemImage: "waveform.badge.exclamationmark")
                Spacer()
            }
            Picker("Magnitude", systemImage: "waveform.badge.exclamationmark", selection: $viewModel.selectedStrength) {
                ForEach(SearchFilterContent.Magnitude.allCases) { item in
                    Text(item.rawValue)
                }
            }
            .pickerStyle(.palette)

            HStack {
                Label("Date", systemImage: "calendar")
                Spacer()
            }
            .padding(.top)

            Picker("Date", systemImage: "calendar", selection: $viewModel.selectedPeriod) {
                ForEach(SearchFilterContent.Period.allCases) { item in
                    Text(item.rawValue)
                }
            }
            .pickerStyle(.palette)

            Button(action: { Task { await viewModel.fetch() } } ) { Text("Search") }
            .buttonStyle(.bordered)
            .padding(.top)
        }
        .frame(width: 450)
    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = Earthquake.mock
    return SearchFiltersView()
        .environment(viewModel)
        .border(Color.black)
}
