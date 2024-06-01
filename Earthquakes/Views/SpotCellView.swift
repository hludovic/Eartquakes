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
        HStack {
            Text("M " + String(format: "%.1f", content.magnitude))
                .minimumScaleFactor(0.9)
                .lineLimit(2)
                .font(.title)
                .frame(width: 90, height: 70, alignment: .center)
                .background { RoundedRectangle(cornerRadius: 25.0)
                        .fill(.gray)
                        .frame(width: 90, height: 70)
                }
            VStack {
                Group {
                    Text(content.place)
                        .font(.title2)
                    HStack {
                        Text("Depth: " + String(format: "%.1f", content.depth) + " Km")
                        Text(content.time.timeAgo())
                            .padding(.leading, 5)
                    }
                }
                .bold(content.time.timeIntervalSinceNow >= -900)
            }
            
            Spacer()
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    SpotCellView(content: FakeData.earthquakes.first!)
}
