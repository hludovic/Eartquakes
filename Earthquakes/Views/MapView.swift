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
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundStyle(Color.black)
                .opacity(0.5)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding()
        }
        .navigationTitle(
            "Earthquakes \(viewModel.selectedStrength.rawValue.lowercased()) recorded \(viewModel.selectedPeriod.rawValue.lowercased())"
        )
    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = FakeData.earthquakes

    return MapView()
        .environment(viewModel)

}
