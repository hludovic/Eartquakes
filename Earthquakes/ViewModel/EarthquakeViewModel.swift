//
//  EarthquakeViewModel.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

import Foundation

class EarthquakeViewModel: ObservableObject, Networking {
    @Published var earthquakes: [Earthquake] = []

    func fetchEarthquakes(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) async throws {
        guard let url = getGeoJSONFeedUrl(since: period, strength: strength) else { throw HttpError.invalidURL}
        let decodedEarthquakes: DecodedEarthquakes = try await HttpClient.shared.fetch(url: url, dateDecodingStrategy: .millisecondsSince1970)
        earthquakes = decodedEarthquakes.earthquakes
    }

    private func getGeoJSONFeedUrl(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) -> URL? {
        let parameter = ApiJsonFeeds.parameters(period: period, strength: strength)
        let urlString: String = ApiJsonFeeds.baseURL + ApiJsonFeeds.endpoint + "/" + parameter + "." + ApiJsonFeeds.FileFormat.json
        return URL(string: urlString)
    }
}

private struct DecodedEarthquakes: Decodable {
    var earthquakes: [Earthquake]

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
                latitude: feature.geometry.coordinates[1])
            result.append(earthquake)
        }
        earthquakes = result
    }
}

private struct RawResponse: Decodable {
    let type: String
    let metadata: Metadata
    let features: [Feature]
}

private struct Metadata: Decodable {
    let title: String
    let status: Int
    let count: Int
}

private struct Propertie: Decodable {
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
}

private struct Feature: Decodable {
    let id: String
    let properties: Propertie
    let geometry: Geometry
}

private struct Geometry: Decodable {
    let type: String
    let coordinates: [Double]
}


