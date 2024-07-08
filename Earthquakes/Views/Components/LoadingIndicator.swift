//
//  LoadingIndicator.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 08/07/2024.
//

import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.2)
                .ignoresSafeArea()
            VStack {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.accentColor)
                    .scaleEffect(1.4)
                Text("Loading...")
                    .padding(.top)
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding()
            .background(.thinMaterial, in: (RoundedRectangle(cornerRadius: 16.0))
            )
        }
    }
}

#Preview {
    LoadingIndicator()
}
