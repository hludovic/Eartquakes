//
//  DecodedEarthquakes.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 26/02/2024.
//

import Foundation

extension EarthquakeViewModel {

    struct DecodedEarthquakes: Decodable {
        let count: Int
        let title: String
        let earthquakes: [Earthquake]

        init(from decoder: Decoder) throws {
            var result: [Earthquake] = []

            let rawEarthquake = try RawResponse(from: decoder)
            let features = rawEarthquake.features

            for feature in features {
                let earthquake = Earthquake(
                    id: feature.id,
                    magnitude: feature.properties.mag,
                    place: feature.properties.place,
                    time: feature.properties.time,
                    updated: feature.properties.updated,
                    url: feature.properties.url,
                    alert: feature.properties.alert,
                    tsunami: feature.properties.tsunami,
                    sig: feature.properties.sig,
                    type: feature.properties.type,
                    title: feature.properties.title,
                    longitude: feature.geometry.coordinates[0],
                    latitude: feature.geometry.coordinates[1],
                    depth: feature.geometry.coordinates[2],
                    status: feature.properties.status
                )
                result.append(earthquake)
            }
            earthquakes = result
            count = rawEarthquake.metadata.count
            title = rawEarthquake.metadata.title
        }
    }

    private struct RawResponse: Decodable {
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
                let time: Date
                let updated: Date
                let url: String
                let alert: String?
                let tsunami: Int
                let sig: Int
                let type: String
                let title: String
                let status: String

            }

            struct Geometry: Decodable {
                let type: String
                let coordinates: [Double]
            }
        }
    }
}

