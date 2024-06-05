//
//  EarthquakeViewModel.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

import Foundation
import Observation
import MapKit

@Observable final class EarthquakeViewModel {
    var earthquakes: [Earthquake] = []
    var selectedPeriod: SearchFilterContent.Period = .aDay
    var selectedStrength: SearchFilterContent.Magnitude = .overMag4_5
    var errorMessage: String = ""
    let httpClient: Networking
    var mapLocations: [MapLocation] {
        guard !earthquakes.isEmpty else { return [] }
        var locations: [MapLocation] = []
        for earthquake in earthquakes {
            var mapLocation = MapLocation(
                name: earthquake.title,
                coordinate: CLLocationCoordinate2D(
                    latitude: earthquake.latitude,
                    longitude: earthquake.longitude
                )
            )
            locations.append(mapLocation)
        }
        return locations
    }

    init(httpClient: Networking = HttpClient.shared) { self.httpClient = httpClient }

    func fetch() async {
        do {
            try await fetchEarthquakes(since: paramPeriod, strength: paramStrength)
        } catch (let error) {
            errorMessage = error.localizedDescription
        }
    }
}

private extension EarthquakeViewModel {

    var paramPeriod: ApiJsonFeeds.Period {
        switch selectedPeriod {
        case .oneHour:
            return .oneHour
        case .aDay:
            return .aDay
        case .aWeek:
            return .aWeek
        case .aMonth:
            return .aMonth
        }
    }

    var paramStrength: ApiJsonFeeds.Strength {
        switch selectedStrength {
        case .all:
            return .all
        case .overMag1:
            return .overMag1
        case .overMag2_5:
            return .overMag2_5
        case .overMag4_5:
            return .overMag4_5
        case .significant:
            return .significant
        }
    }


    func fetchEarthquakes(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) async throws {
        let parameter = "\(strength.rawValue)_\(period.rawValue)"
        let urlString: String = ApiJsonFeeds.baseURL + ApiJsonFeeds.endpoint + "/" + parameter + "." + ApiJsonFeeds.FileFormat.json
        guard let url = URL(string: urlString) else { throw HttpError.invalidURL}
        let decodedEarthquakes: DecodedEarthquakes = try await httpClient.fetch(url: url, dateDecodingStrategy: .millisecondsSince1970)
        earthquakes = decodedEarthquakes.earthquakes
    }
}

