//
//  SearchFiltersView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 03/06/2024.
//

import SwiftUI

struct SearchFiltersView: View {

    var body: some View {
        HStack {
            Menu("Magnitude", systemImage: "waveform.badge.exclamationmark") {
                Button(action: selection) {
                    Label("All records", systemImage: "")
                }
                .disabled(false)

                Button(action: selection) {
                    Label("Over Magnitude 1", systemImage: "checkmark")
                }
                .disabled(false)

                Button(action: selection) {
                    Label("Over Magnitude 2.5", systemImage: "")
                }
                .disabled(false)

                Button(action: selection) {
                    Label("Over Magnitude 4.5", systemImage: "")
                }
                .disabled(false)

                Button(action: selection) {
                    Label("Only the Significants", systemImage: "")
                }
                .disabled(false)
            }

            Menu("Date", systemImage: "calendar") {
                Button(action: selection) {
                    Label("Since One Hour", systemImage: "")
                }
                .disabled(true)

                Button(action: selection) {
                    Label("Since One Day", systemImage: "")
                }
                .disabled(false)

                Button(action: selection) {
                    Label("Since One Week", systemImage: "checkmark")
                }
                .disabled(false)

                Button(action: selection) {
                    Label("Since One Month", systemImage: "")
                }
                .disabled(false)
            }
            Spacer()

            Button(action: selection ) {
                Label("Invert List", systemImage: "arrow.up.arrow.down")
                    .labelStyle(.iconOnly)
            }

            Button(action: selection ) {
                Label("Search", systemImage: "text.magnifyingglass")
                    .labelStyle(.iconOnly)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }

    func selection() {print("hello") }
}

#Preview {
    SearchFiltersView()
}
