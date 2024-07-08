//
//  SearchButtonStyle.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 08/07/2024.
//

import SwiftUI

struct SearchButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(.quaternary, in: RoundedRectangle(cornerRadius: 10.0))
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(SearchButtonStyle())
}
