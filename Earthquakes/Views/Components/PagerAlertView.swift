//
//  PagerAlertView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 09/07/2024.
//

import SwiftUI

struct PagerAlertView: View {
    enum AlertColor: String {
        case green = "green"
        case yellow = "yellow"
        case orange = "orange"
        case red = "red"
        case unknown = "unknown"
    }
    @Binding var earthquake: Earthquake?

    var body: some View {
        let color: AlertColor = convertStringColor(earthquake: earthquake)

        switch color {
        case .green:
            return HStack {
                Color.green
                    .frame(width: 20, height: 20)
                Text("Green")
                    .italic()
            }
        case .yellow:
            return HStack {
                Color.yellow
                    .frame(width: 20, height: 20)
                Text("Yellow")
                    .italic()
            }
        case .orange:
            return HStack {
                Color.orange
                    .frame(width: 20, height: 20)
                Text("Orange")
                    .italic()
            }
        case .red:
            return HStack {
                Color.red
                    .frame(width: 20, height: 20)
                Text("Red")
                    .italic()
            }
        case .unknown:
            return HStack {
                Color.white
                    .frame(width: 20, height: 20)
                Text("Unknown")
                    .italic()
            }
        }
    }

    func convertStringColor(earthquake: Earthquake?) -> AlertColor {
        guard let earthquake else { return AlertColor.unknown }
        guard let stringColor = earthquake.alert else { return AlertColor.unknown }
        let stringFormated = stringColor.lowercased()
        guard let color = AlertColor(rawValue: stringFormated) else { return AlertColor.unknown }
        return color
    }
}

#Preview {
    PagerAlertView(earthquake: .constant(Earthquake.mock.first))
        .frame(width: 120, height: 100, alignment: .center)
        .border(Color.black)
}
