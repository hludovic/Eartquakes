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
                .foregroundStyle(Color.black)
                .frame(
                    width: isSelected ? radius + 20 : radius + 1,
                    height: isSelected ? radius + 20 : radius + 1
                )
            Circle()
                .foregroundStyle(isSelected ? Color.blue : Color.red)
                .frame(width: radius, height: radius)
        }
        .opacity(0.4)
    }
}

#Preview {
    MapItemView(radius: 40)
}
