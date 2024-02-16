//
//  Constants.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 30/01/2024.
//

struct ApiJsonFeeds {
    static let baseURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/"
    static let endpoint = "summary"

    enum Parameters {
        static let hour_all = "all_hour"
        static let hour_1_0 = "1.0_hour"
        static let hour_2_5 = "2.5_hour"
        static let hour_4_5 = "4.5_hour"
        static let hour_significant = "significant_hour"
        static let day_all = "all_day"
        static let day_1_0 = "1.0_day"
        static let day_2_5 = "2.5_day"
        static let day_4_5 = "4.5_day"
        static let day_significant = "significant_day"
        static let week_all = "all_week"
        static let week_1_0 = "1.0_week"
        static let week_2_5 = "2.5_week"
        static let week_4_5 = "4.5_week"
        static let week_significant = "significant_week"
        static let month_all = "all_month"
        static let month_1_0 = "1.0_month"
        static let month_2_5 = "2.5_month"
        static let month_4_5 = "4.5_month.geojson"
        static let month_significant = "significant_month"
    }

    enum FileFormat {
        static let json = "geojson"
        static let xml = "xml"
        static let csv = "csv"
        static let txt = "txt"
    }
}
