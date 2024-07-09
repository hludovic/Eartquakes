//
//  InspectorView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 06/07/2024.
//

import SwiftUI

struct InspectorView: View {
    @Binding var earthquake: Earthquake?

    var body: some View {
        Form {
            Section("Location") {
                Text("Place")
                    .bold()
                Text(earthquake?.title ?? "")
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
                    Text("REVIEWED")
                        .italic()
                }
                HStack {
                    Text("Magnitude")
                        .bold()
                    Spacer()
                    Text("\(earthquake?.magnitude.description ?? "") mw")
                        .italic()
                }
                HStack {
                    Text("Depth")
                        .bold()
                    Spacer()
                    Text("\(earthquake?.depth.description ?? "") km")
                        .italic()
                }
                HStack {
                    Text("Time")
                        .bold()
                    Spacer()
                    Text(earthquake?.time.toString() ?? "")
                        .italic()
                }
            }
            Section("Pager") {
                HStack {
                    Text("Alert")
                        .bold()
                    Spacer()
                    PagerAlertView(earthquake: $earthquake)
                        .italic()
                }
            }
            Section("USGS report") {
                Text("More Informations")
                    .bold()
                Text("\(earthquake?.url ?? "")")
                    .italic()
            }
        }
    }
}

#Preview {
    InspectorView(earthquake: .constant(Earthquake.mock.first!))
        .frame(width: 300, height: 700)
        .border(Color.black)
}
