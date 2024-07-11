//
//  LoadingIndicator.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 08/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.9)
                .ignoresSafeArea()
            VStack {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.accentColor)
                    .scaleEffect(1.4)
                Text("Loading...")
                    .padding(.top)
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(.thickMaterial, in: (RoundedRectangle(cornerRadius: 16.0))
            )
        }
    }
}

#Preview {
    LoadingView()
}
