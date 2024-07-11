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
                ForEach(viewModel.earthquakes) { mapLocation in
                    Annotation(mapLocation.title, coordinate: mapLocation.coordinate) { 
                        MapItemView(radius: mapLocation.mapItemRadius)
                            .onTapGesture { viewModel.selectedCell = mapLocation }

                    }
                }
            }
            MapButtons()
        }
        .navigationTitle(viewModel.navigationTitle)
    }
}

#Preview {
    return MapView()
        .environment(EarthquakeViewModel(mockEarthquakes: Earthquake.mock))
}
