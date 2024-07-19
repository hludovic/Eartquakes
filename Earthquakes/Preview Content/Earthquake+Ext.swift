//
//  Earthquake+Ext.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 01/07/2024.
//

import Foundation

extension Earthquake {
    private static let fakeDates: [Date] = [
        Date.now.addingTimeInterval(-(5 * 60)),
        Date.now.addingTimeInterval(-(10 * 60)),
        Date.now.addingTimeInterval(-(18 * 60)),
        Date.dateCreator(year: 2024, month: 3, day: 14)
    ]

    static let mock: [Earthquake] = [
        Earthquake(
            id: "2672e2a1-38f5-49a9-8eae-cc43909423cb",
            magnitude: 4.81,
            magType: "md",
            place: "3 km NNW of El Centro, CA",
            time: fakeDates[0],
            updated: Date.now,
            url: "https://earthquake.usgs.gov/earthquakes/eventpage/ci40666288",
            alert: "green",
            tsunami: 1,
            sig: 926,
            type: "earthquake",
            title: "M 4.8 - 3 km NNW of El Centro, CA",
            longitude:  -115.5735,
            latitude: 32.8135,
            depth: 46.08,
            status: "reviewed"
        ),
        Earthquake(
            id: "e0f80929-4130-40d1-90ae-291b3e7e4ad1",
            magnitude: 4.81,
            magType: "md",
            place: "51 km NNE of Port-Olry, Vanuatu",
            time: fakeDates[1],
            updated: Date.now,
            url: "https://earthquake.usgs.gov/earthquakes/eventpage/ci40666288",
            alert: "green",
            tsunami: 1,
            sig: 926,
            type: "earthquake",
            title: "M 6.3 - 51 km NNE of Port-Olry, Vanuatu",
            longitude:  -115.5735,
            latitude: 32.8135,
            depth: 33.77,
            status: "reviewed"
        ),
        Earthquake(
            id: "92d5dffe-b2fd-419c-b6d1-e7311e716b94",
            magnitude: 4.81,
            magType: "mww",
            place: "3 km NNW of El Centro, CA",
            time: fakeDates[2],
            updated: Date.now,
            url: "https://earthquake.usgs.gov/earthquakes/eventpage/ci40666288",
            alert: "green",
            tsunami: 1,
            sig: 926,
            type: "earthquake",
            title: "M 4.8 - 3 km NNW of El Centro, CA",
            longitude:  -115.5735,
            latitude: 32.8135,
            depth: 36.311,
            status: "reviewed"
        ),
        Earthquake(
            id: "2fe4f233-a1cc-4869-aa3d-617dd21b27fe",
            magnitude: 4.81,
            magType: "ml",
            place: "3 km NNW of El Centro, CA",
            time: fakeDates[3],
            updated: Date.now,
            url: "https://earthquake.usgs.gov/earthquakes/eventpage/ci40666288",
            alert: "green",
            tsunami: 1,
            sig: 926,
            type: "earthquake",
            title: "M 4.8 - 3 km NNW of El Centro, CA",
            longitude:  -115.5735,
            latitude: 32.8135,
            depth: 57.745,
            status: "reviewed"
        )
    ]
}
