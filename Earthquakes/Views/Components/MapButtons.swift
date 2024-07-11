//
//  MapMenuBgnd.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 04/07/2024.
//

import SwiftUI

struct MapButtons: View {
    @Environment(EarthquakeViewModel.self) private var viewModel

    var body: some View {
        RoundedRectangle(cornerRadius: 15.0)
            .frame(width: 50, height: 130, alignment: .center)
            .foregroundStyle(Color.gray)
            .padding()
            .opacity(0.8)
            .overlay {
                VStack(spacing: 15) {
                    Button(action: { viewModel.pressResetMapButton() }) {
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                                .opacity(0.4)
                            .padding(5)
                    }
                    Divider()
                        .frame(width: 40)
                    Button(action: { print("Button Ask Location Pressed") }) {
                        Image(systemName: "location")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                            .opacity(0.4)
                            .padding(5)
                    }
                }
            }
    }
}

#Preview {
    MapButtons()
        .environment(EarthquakeViewModel(mockEarthquakes: Earthquake.mock))
}
