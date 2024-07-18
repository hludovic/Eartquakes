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
                .stroke(Color.secondary, lineWidth: isSelected ? 10 : 1)
                .frame(width: isSelected ? radius + 10 : radius)
            Circle()
                .foregroundStyle(Color.mapItem)
                .frame(width: radius)
        }
        .opacity(0.4)
    }
}

#Preview {
    MapItemView(radius: 40)
}
