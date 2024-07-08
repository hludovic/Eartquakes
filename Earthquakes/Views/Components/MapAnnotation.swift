//
//  MapAnnotation.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 07/07/2024.
//

import SwiftUI

struct MapAnnotation: View {
    var body: some View {
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

#Preview {
    MapAnnotation()
}
