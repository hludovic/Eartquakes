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
                        MapAnnotation()
                    }
                }
            }
            MapMenuBgnd()
                .overlay {
                    VStack(spacing: 15) {
                        Button(action: { viewModel.pressResetMapButton() }) {
                            ResetMapButton()
                        }
                        Divider()
                            .frame(width: 40)
                        Button(action: {}) {
                            AskLocationButton()
                        }
                    }
                }
        }
        .navigationTitle(viewModel.navigationTitle)
    }
}

#Preview {
    return MapView()
        .environment(EarthquakeViewModel(mockEarthquakes: Earthquake.mock))

}
