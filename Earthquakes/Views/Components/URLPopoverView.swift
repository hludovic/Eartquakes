//
//  URLPopoverView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 15/07/2024.
//

import SwiftUI

struct URLPopoverView: View {
    @Environment(\.openURL) var openURL
    let urlString: String?

    var body: some View {
        VStack {
            Button(action: { copyToClipboard() }, label: {
                Text("Copy to Clipboard")
                    .frame(width: 150)
            })
            .buttonStyle(.bordered)
            Button(action: { openInBrowser() }, label: {
                Text("Open in Browser")
                    .frame(width: 150)
            })
            .buttonStyle(.bordered)
        }
        .padding()
        .presentationBackground(.thinMaterial)
    }

    func copyToClipboard() {
        if let urlString {
            let pastboard = UIPasteboard.general
            pastboard.string = urlString
        }
    }

    func openInBrowser() {
        guard let urlString else { return }
        guard let url = URL(string: urlString) else { return }
        openURL(url)
    }
}

#Preview {
    URLPopoverView(urlString: "www.google.fr")
}
