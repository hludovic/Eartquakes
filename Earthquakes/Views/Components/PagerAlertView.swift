//
//  PagerAlertView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 09/07/2024.
//

import SwiftUI

struct PagerAlertView: View {
    private enum AlertColor: String {
        case green = "green"
        case yellow = "yellow"
        case orange = "orange"
        case red = "red"
        case unknown = "None"
    }
    var earthquake: Earthquake?
    private var color: AlertColor { convertStringColor(earthquake: earthquake) }

    var body: some View {
        switch color {
        case .green:
            return HStack {
                Color.green
                    .frame(width: 20, height: 20)
                Text(AlertColor.green.rawValue.capitalized)
                    .italic()
            }
        case .yellow:
            return HStack {
                Color.yellow
                    .frame(width: 20, height: 20)
                Text(AlertColor.yellow.rawValue.capitalized)
                    .italic()
            }
        case .orange:
            return HStack {
                Color.orange
                    .frame(width: 20, height: 20)
                Text(AlertColor.orange.rawValue.capitalized)
                    .italic()
            }
        case .red:
            return HStack {
                Color.red
                    .frame(width: 20, height: 20)
                Text(AlertColor.red.rawValue.capitalized)
                    .italic()
            }
        case .unknown:
            return HStack {
                Color.white
                    .frame(width: 20, height: 20)
                Text(AlertColor.unknown.rawValue.capitalized)
                    .italic()
            }
        }
    }

    private func convertStringColor(earthquake: Earthquake?) -> AlertColor {
        guard let earthquake else { return AlertColor.unknown }
        guard let stringColor = earthquake.alert else { return AlertColor.unknown }
        let stringFormated = stringColor.lowercased()
        guard let color = AlertColor(rawValue: stringFormated) else { return AlertColor.unknown }
        return color
    }
}

#Preview {
    PagerAlertView(earthquake: Earthquake.mock.first)
}
