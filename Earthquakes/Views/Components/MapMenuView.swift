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
                .opacity(0.8)
            VStack(alignment: .center, spacing: 15) {
                Button(action: {
                    withAnimation { viewModel.mapPosition = .automatic }
                }) {
                    Image(systemName: "globe")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                        .opacity(0.4)
                        .padding(5)
                }
                Divider()
                    .frame(width: 40)
                Button(action: {}) {
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
    let viewModel = EarthquakeViewModel()
    viewModel.earthquakes = Earthquake.mock

    return MapMenuView()
        .environment(viewModel)
}
