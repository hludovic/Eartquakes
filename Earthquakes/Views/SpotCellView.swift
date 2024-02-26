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
        Text(content.title)
    }
}

#Preview {
    SpotCellView(content: FakeData.earthquakes.first!)
}
