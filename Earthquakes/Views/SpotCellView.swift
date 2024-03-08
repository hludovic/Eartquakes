//
//  SpotCellView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 25/02/2024.
//

import SwiftUI

struct SpotCellView: View {
    @State var content: Earthquake

    var body: some View {
        Text("M - " + String(format: "%.1f", 4.3))
            .frame(width: 90, height: 90, alignment: .center)
            .background { Color(.blue).clipShape(Circle()) }
            .background {
                Color(.red)
            }
            .frame(maxWidth: .infinity)
            .border(Color.blue)
        Text(content.place)
        Text(String(format: "%.1f", content.depth) + " Km")
    }
}

#Preview {
    SpotCellView(content: FakeData.earthquakes.first!)
}
