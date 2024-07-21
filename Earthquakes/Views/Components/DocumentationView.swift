//
//  DocumentationView.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 16/07/2024.
//

import SwiftUI

struct DocumentationView: View {
    var body: some View {
        NavigationStack {

            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    HStack {
                        Image("usgs_logo")
                        Text("All data from this application has been provided by the U.S. Geological Survey (USGS) https://www.usgs.gov")
                            .italic()
                            .padding(.top, 10)
                    }
                    .padding()
                    .padding(.bottom, 30)
                    Text("Glossary of words describing each events")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .bold()
                    ForEach(Glossary.items) { item in
                        Text("\(item.title):")
                            .padding(.top, 10)
                            .font(.title2)
                            .bold()
                        Text("\(item.definition)")
                            .italic()
                            .padding(.leading)

                        if item.moreInformation != nil {
                            Button(action: {}) {
                                Text("More Informations...")
                            }
                            .padding(.leading, 30)
                        }
                    }
                    Spacer()
                }
            }
            .padding([.horizontal], 40)
            .padding(.bottom)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Documentation")
        }
    }
}

#Preview {
    DocumentationView()
}
