//
//  MapMenuView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 14/06/2024.
//

import SwiftUI

struct MapMenuView: View {
    @Environment(EarthquakeViewModel.self) private var viewModel

    var body: some View {
        ZStack {
            MapMenuBgnd()
            VStack(alignment: .center, spacing: 15) {
                Button(action: {
                    withAnimation { viewModel.mapPosition = .automatic }
                }) {
                    Image(systemName: "globe")
                        .resizable()
                        .foregroundStyle(.black)
                        .opacity(0.4)
                        .frame(width: 25, height: 25)
                }
                Divider()
                    .frame(width: 20)
                Button(action: {}) {
                    Image(systemName: "location")
                        .resizable()
                        .foregroundStyle(.black)
                        .opacity(0.4)
                        .frame(width: 25, height: 25)
                }
            }
        }
    }
}

#Preview {
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = Earthquake.mock

    return MapMenuView()
        .environment(viewModel)
}
