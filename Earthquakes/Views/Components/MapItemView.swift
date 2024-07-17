//
//  MapItemView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 11/07/2024.
//

import SwiftUI
import MapKit

struct MapItemView: View {
    var radius: CGFloat
    var isSelected: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.mapItemBorder)
                .frame(
                    width: isSelected ? radius + 20 : radius + 1,
                    height: isSelected ? radius + 20 : radius + 1
                )
                .opacity(0.4)

            Circle()
                .foregroundStyle(isSelected ? Color.accentColor : Color.accentColor)
                .frame(width: radius, height: radius)
                .opacity(isSelected ? 0.7 : 0.4)
        }
    }
}

#Preview {
    MapItemView(radius: 40)
}
