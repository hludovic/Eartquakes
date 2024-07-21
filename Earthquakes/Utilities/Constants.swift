//
//  Constants.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 30/01/2024.
//

import Foundation

/// Contains the global constants used in this application.
struct Constants {
    /// The maximum amount of elements that can be displayed in the `EarthquakesView` and on the `MapView`.
    static let resultLimit: Int = 300
    static let mapCameraDistance: Double = 10_000_000
}

struct ApiJsonFeeds {
    static let baseURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/"
    static let endpoint = "summary"

    enum Period: String {
        case oneHour = "hour"
        case aDay = "day"
        case aWeek = "week"
        case aMonth = "month"
    }

    enum Strength: String {
        case all = "all"
        case overMag1 = "1.0"
        case overMag2_5 = "2.5"
        case overMag4_5 = "4.5"
        case significant = "significant"
    }

    enum FileFormat {
        static let json = "geojson"
        static let xml = "xml"
        static let csv = "csv"
        static let txt = "txt"
    }
}

struct SearchFilterContent {
    enum Magnitude: String, CaseIterable, Identifiable {
        var id: Self { return self }
        case all = "All records"
        case overMag1 = "Mag 1 +"
        case overMag2_5 = "Mag 2.5 +"
        case overMag4_5 = "Mag 4.5 +"
        case significant = "Significants"
    }

    enum Period: String, CaseIterable, Identifiable {
        var id: Self { return self }
        case oneHour = "Past Hour"
        case aDay = "Past Day"
        case aWeek = "Past 7 Days"
        case aMonth = "Past 30 Days"
    }
}

struct Glossary {
    struct GlossaryItem: Identifiable {
        var id = UUID()
        let title: String
        let definition: String
        let moreInformation: String?
    }

    static let items: [GlossaryItem] = [
        GlossaryItem(
            title: "Place",
            definition: "Description of named geographic region near to the event.",
            moreInformation: nil
        ),
        GlossaryItem(
            title: "Longitude & Latitude",
            definition: "Latitude and Longitude are the units that represent the coordinates at geographic coordinate system.",
            moreInformation: nil
        ),
        GlossaryItem(
            title: "Review Status",
            definition: "Indicates whether the event has been reviewed by a human.",
            moreInformation: nil
        ),
        GlossaryItem(
            title: "Magnitude",
            definition: "The magnitude for the event. See also \"Magnitude Type\".",
            moreInformation: nil
        ),
        GlossaryItem(
            title: "Magnitude Type",
            definition: "It is the method or algorithm used to calculate the preferred magnitude for the event. The typical values are “Md”, “Ml”, “Ms”, “Mw”, “Me”, “Mi”, “Mb”, “MLg”. ",
            moreInformation: "https://earthquake.usgs.gov/data/comcat/index.php#magType"
        ),
        GlossaryItem(
            title: "Depth",
            definition: "Depth of the event in kilometers.",
            moreInformation: nil
        ),
        GlossaryItem(
            title: "Time",
            definition: "Time when the event occurred.",
            moreInformation: nil
        ),
        GlossaryItem(
            title: "Alert",
            definition: "The alert level from the PAGER earthquake impact scale. The typical values are “green”, “yellow”, “orange”, “red”.",
            moreInformation: "https://earthquake.usgs.gov/data/comcat/index.php#alert"
        ),
        GlossaryItem(
            title: "PAGER",
            definition: "The PAGER system provides fatality and economic loss impact estimates following significant earthquakes worldwide.",
            moreInformation: "https://earthquake.usgs.gov/data/pager/"
        ),
    ]
}
