//
//  Earthquake.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 30/01/2024.
//

import Foundation

struct Earthquake: Decodable {
    let type: String
    let metadata: Metadata
    let features: [Feature]

    struct Metadata: Decodable {
        let title: String
        let status: Int
        let count: Int
    }

    struct Feature: Decodable {
        let id: String
        let properties: Propertie
        let geometry: Geometry

        struct Propertie: Decodable {
            let mag: Float
            let place: String
            let time: Int
            let updated: Int
            let tz: Int?
            let url: String
            let alert: String?
            let tsunami: Int
            let sig: Int
            let type: String
            let title: String
        }

        struct Geometry: Decodable {
            let type: String
            let coordinates: [Double]
        }
    }
}


struct EarthquakeResult: Decodable {
    var earthquakes: [RawResponse]

    struct RawResponse {
        let magnitude: Float
        let place: String
        let time: Int
        let updated: Int
        let tz: Int?
        let url: String
        let alert: String?
        let tsunami: Int
        let sig: Int
        let type: String
        let title: String
        let coordinates: [Double]

        enum CodingKeys:String,  CodingKey {
            case magnitude = "mag"
            case place
            case time
            case updated
            case tz
            case url
            case alert
            case tsunami
            case sig
            case type
            case title
        }
    }

    init(from decoder: Decoder) throws {
        var result: [RawResponse] = []


        let rawEarthquake = try Earthquake(from: decoder)
        let features = rawEarthquake.features

        for feature in features {
            let aa = RawResponse(
                magnitude: feature.properties.mag,
                place: feature.properties.place,
                time: feature.properties.time,
                updated: feature.properties.updated,
                tz: feature.properties.tz,
                url: feature.properties.url,
                alert: feature.properties.alert,
                tsunami: feature.properties.tsunami,
                sig: feature.properties.sig,
                type: feature.properties.type,
                title: feature.properties.title,
                coordinates: feature.geometry.coordinates)
            result.append(aa)
        }
        earthquakes = result




//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.mag = try container.decode(Float.self, forKey: .mag)
//        self.place = try container.decode(String.self, forKey: .place)
//        self.time = try container.decode(Int.self, forKey: .time)
//        self.updated = try container.decode(Int.self, forKey: .updated)
//        self.tz = try container.decodeIfPresent(Int.self, forKey: .tz)
//        self.url = try container.decode(String.self, forKey: .url)
//        self.alert = try container.decodeIfPresent(String.self, forKey: .alert)
//        self.tsunami = try container.decode(Int.self, forKey: .tsunami)
//        self.sig = try container.decode(Int.self, forKey: .sig)
//        self.type = try container.decode(String.self, forKey: .type)
//        self.title = try container.decode(String.self, forKey: .title)
    }
}
