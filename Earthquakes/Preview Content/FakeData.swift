//
//  FakeData.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 20/02/2024.
//

import Foundation

struct FakeData {
    private static let fakeDates: [Date] = [
        Date.now.addingTimeInterval(-(5 * 60)),
        Date.now.addingTimeInterval(-(10 * 60)),
        Date.now.addingTimeInterval(-(18 * 60)),
        Date.dateCreator(year: 2024, month: 3, day: 14)
    ]

    static let earthquakes: [Earthquake] = [
        Earthquake(
            id: UUID().uuidString,
            magnitude: 4.81,
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
            depth: 46.08
        ),
        Earthquake(
            id: UUID().uuidString,
            magnitude: 4.81,
            place: "3 km NNW of El Centro, CA",
            time: fakeDates[1],
            updated: Date.now,
            url: "https://earthquake.usgs.gov/earthquakes/eventpage/ci40666288",
            alert: "green",
            tsunami: 1,
            sig: 926,
            type: "earthquake",
            title: "M 4.8 - 3 km NNW of El Centro, CA",
            longitude:  -115.5735,
            latitude: 32.8135,
            depth: 33.77
        ),
        Earthquake(
            id: UUID().uuidString,
            magnitude: 4.81,
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
            depth: 36.311
        ),
        Earthquake(
            id: UUID().uuidString,
            magnitude: 4.81,
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
            depth: 57.745
        )
    ]
}
