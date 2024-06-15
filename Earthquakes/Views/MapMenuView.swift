//
//  MapMenuView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 14/06/2024.
//

import SwiftUI

struct MapMenuView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundStyle(Color.black)
            .opacity(0.5)
            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

#Preview {
    MapMenuView()
}
