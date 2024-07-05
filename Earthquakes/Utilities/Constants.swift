//
//  Constants.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 30/01/2024.
//

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
        case oneHour = "Since One Hour"
        case aDay = "Since One Day"
        case aWeek = "Since A Week"
        case aMonth = "Since A Month"
    }
}
