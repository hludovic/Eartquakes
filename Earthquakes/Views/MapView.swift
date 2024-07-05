//
//  MapView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 04/06/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(EarthquakeViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel

        ZStack(alignment: .topTrailing) {
            Map(position: $viewModel.mapPosition, interactionModes: [.pitch, .zoom, .pan]) {
                ForEach(viewModel.mapLocations) { mapLocation in
                    Annotation(mapLocation.name, coordinate: mapLocation.coordinate) {
                        ZStack {
                            Circle()
                                .foregroundStyle(Color.black)
                                .frame(width: 21, height: 21)
                            Circle()
                                .foregroundStyle(Color.red)
                                .frame(width: 20, height: 20)
                        }
                        .opacity(0.5)
                    }
                }
            }
            MapMenuView()
                .environment(viewModel)
        }
        .navigationTitle(
            "Earthquakes \(viewModel.selectedStrength.rawValue.lowercased()) recorded \(viewModel.selectedPeriod.rawValue.lowercased())"
        )
    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = Earthquake.mock

    return MapView()
        .environment(viewModel)

}
