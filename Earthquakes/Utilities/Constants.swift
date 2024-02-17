//
//  Constants.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 30/01/2024.
//

struct ApiJsonFeeds {
    static let baseURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/"
    static let endpoint = "summary"

    static func parameters(period: Period, strength: Strength) -> String {
        let periodString: String
        switch period {
        case .oneHour:
            periodString = "hour"
        case .aDay:
            periodString = "day"
        case .aWeek:
            periodString = "week"
        case .aMonth:
            periodString = "month"
        }

        let strengthString: String
        switch strength {
        case .all:
            strengthString = "all"
        case .overMag1:
            strengthString = "1.0"
        case .overMag2_5:
            strengthString = "2.5"
        case .overMag4_5:
            strengthString = "4.5"
        case .significant:
            strengthString = "significant"
        }
        return "\(strengthString)_\(periodString)"
    }

    enum Period { case oneHour, aDay, aWeek, aMonth }
    enum Strength { case all, overMag1, overMag2_5, overMag4_5, significant }

    enum FileFormat {
        static let json = "geojson"
        static let xml = "xml"
        static let csv = "csv"
        static let txt = "txt"
    }
}
