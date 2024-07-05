//
//  MapMenuBgnd.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 04/07/2024.
//

import SwiftUI

struct MapMenuBgnd: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15.0)
            .frame(width: 50, height: 120, alignment: .center)
            .foregroundStyle(Color.gray)
            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

#Preview {
    MapMenuBgnd()
}
