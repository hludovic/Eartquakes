//
//  InspectorView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 06/07/2024.
//

import SwiftUI

struct InspectorView: View {
    var earthquake: Earthquake?
    @State private var isShowingURLPopuver: Bool = false

    var body: some View {
        Form {
            Section("Location") {
                Text("Place")
                    .bold()
                Text(earthquake?.place ?? "")
                    .italic()
                HStack {
                    Text("Longitude")
                        .bold()
                    Spacer()
                    Text("\(earthquake?.longitude.description ?? "")")
                        .italic()
                }
                HStack {
                    Text("Latitude")
                        .bold()
                    Spacer()
                    Text("\(earthquake?.latitude.description ?? "")")
                        .italic()
                }
            }
            Section("Origin") {
                HStack {
                    Text("Review Status")
                        .bold()
                    Spacer()
                    Text(earthquake?.status.uppercased() ?? "")
                        .italic()
                }
                HStack {
                    Text("Magnitude")
                        .bold()
                    Spacer()
                    Text(stringMagnitude())
                        .italic()
                }
                HStack {
                    Text("Depth")
                        .bold()
                    Spacer()
                    Text(stringDepth())
                        .italic()
                }
                HStack {
                    Text("Time")
                        .bold()
                    Spacer()
                    Text(earthquake?.time.toString() ?? "")
                        .italic()
                }
                HStack {
                    Text("Updated")
                        .bold()
                    Spacer()
                    Text(earthquake?.updated.toString() ?? "")
                        .italic()
                }
            }
            Section("Pager") {
                HStack {
                    Text("Alert")
                        .bold()
                    Spacer()
                    PagerAlertView(earthquake: earthquake)
                        .italic()
                }
            }
            Section("USGS report") {
                Text("More Informations")
                    .bold()
                Text("\(earthquake?.url ?? "")")
                    .foregroundStyle(Color.accentColor)
                    .italic()
                    .onTapGesture { isShowingURLPopuver.toggle() }
                    .popover(isPresented: $isShowingURLPopuver) {
                        URLPopoverView(urlString: earthquake?.url)
                    }
            }
        }
    }

    func stringDepth() -> String {
        guard let earthquake else { return "" }
        return "\(earthquake.depth.description) km"
    }

    func stringMagnitude() -> String {
        guard let earthquake else { return "" }
        return "\(earthquake.magnitude.description) \(earthquake.magType)"
    }
}

#Preview {
    InspectorView(earthquake: Earthquake.mock.first!)
        .frame(width: 300, height: 700)
}
