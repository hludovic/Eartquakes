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

struct TempDecodedArray: Decodable {
    var features: [Feature]

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
            let coordinates: [Double]
        }
    }
}
