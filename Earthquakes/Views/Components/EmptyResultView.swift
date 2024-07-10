//
//  EmptyResultView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 09/06/2024.
//

import SwiftUI

struct EmptyResultView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("No result found")
                .font(.title)
                .padding(.bottom, 20)
            HStack {
                Text("Press the button")
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            Text("to make a new search")
                .padding(.bottom, 10)
            Spacer()
        }
        .listRowSeparator(.hidden, edges: .all)
    }
}

#Preview {
    EmptyResultView()
}
