//
//  SpotListView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 19/02/2024.
//

import SwiftUI

struct SpotListView: View {
    @State var content: [Earthquake]

    var body: some View {
        List {
            ForEach(content) { content in
                SpotCellView(content: content)
            }
        }
    }
}

#Preview {
    
    SpotListView(content: FakeData.earthquakes)
}
