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
            .frame(width: 50, height: 130, alignment: .center)
            .foregroundStyle(Color.gray)
            .padding()
            .opacity(0.8)
    }
}

#Preview {
    MapMenuBgnd()
}
