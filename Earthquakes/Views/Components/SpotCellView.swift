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
                .lineLimit(1)
                .font(.callout)
                .frame(width: 50, height: 45, alignment: .center)
                .background { RoundedRectangle(cornerRadius: 10.0)
                        .fill(.gray)
                        .frame(width: 50, height: 45)
                }
            VStack(alignment: .leading) {
                Group {
                    Text(content.place)
                        .lineLimit(2)
                        .minimumScaleFactor(0.7)
                        .bold()
                    HStack {
                        Image(systemName: "arrow.down.and.line.horizontal.and.arrow.up")
                        Text(String(format: "%.1f", content.depth) + " Km")
                            .offset(x: -5)
                        Image(systemName: "clock")
                        Text(content.time.timeAgo())
                            .offset(x: -5)
                    }
                    .font(.caption)
                }
                .italic(content.time.timeIntervalSinceNow >= -900)
            }
            Spacer()
        }
    }
}

#Preview {
    SpotCellView(content: Earthquake.mock.first!)
}
