//
//  AskLocationButton.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 07/07/2024.
//

import SwiftUI

struct AskLocationButton: View {
    var body: some View {
        Image(systemName: "location")
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundColor(.black)
            .opacity(0.4)
            .padding(5)
    }
}

#Preview {
    AskLocationButton()
}
