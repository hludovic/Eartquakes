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
