//
//  EmptyResultView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 09/06/2024.
//

import SwiftUI

struct EmptyResultView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
            }
            Text("No result found")
                .padding(.top, 100)
                .font(.title)
                .padding(.bottom, 20)
            Group {
                HStack {
                    Text("Press the button")
                    Image(systemName: "text.magnifyingglass")
                }
                Text("to make a new search")
                    .padding(.bottom, 10)
            }

            HStack {
                Text("You can pull")
                Image(systemName: "menubar.arrow.down.rectangle")
                Text("to refresh")
            }
            .font(.caption2)
        }
        .listRowSeparator(.hidden, edges: .all)

    }
}

#Preview {
    EmptyResultView()
}
