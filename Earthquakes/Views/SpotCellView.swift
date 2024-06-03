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
            VStack(alignment: .leading) {
                Group {
                    Text(content.place)
                        .font(.title2)
                    HStack {
                        Image(systemName: "arrow.down.and.line.horizontal.and.arrow.up")
                        Text("A depth of " + String(format: "%.1f", content.depth) + " Km")
                            .offset(x: -5)

                        Image(systemName: "clock")
                            .padding(.leading)
                        Text(content.time.timeAgo())
                            .offset(x: -5)
                    }
                }
                .bold(content.time.timeIntervalSinceNow >= -900)
                .minimumScaleFactor(0.9)
                .lineLimit(1)

            }
            
            Spacer()
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SpotCellView(content: FakeData.earthquakes.first!)
}
