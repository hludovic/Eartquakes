//
//  EarthquakeViewModel.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

import Foundation
import Observation
import MapKit
import SwiftUI

@Observable final class EarthquakeViewModel {
    var earthquakes: [Earthquake] = []
    var selectedPeriod: SearchFilterContent.Period = .aDay
    var selectedStrength: SearchFilterContent.Magnitude = .overMag4_5
    var isShowingError: Bool = false
    var error: EarthquakeError = .invalidURL
    let httpClient: Networking
    var mapPosition: MapCameraPosition = .automatic
    var searchButtonActivated: Bool = false
    var textSearch: String = ""
    var bottomListCountString: String { return earthquakes.count > 0 ? "\(earthquakes.count) found" : "" }
    var mapLocations: [MapLocation] {
        guard !earthquakes.isEmpty else { return [] }
        var locations: [MapLocation] = []
        for earthquake in earthquakes {
            let mapLocation = MapLocation(
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
        guard canFetch() else {
            error = .cantFetch
            return isShowingError = true
        }
        do {
            try await fetchEarthquakes(since: paramPeriod, strength: paramStrength)
        } catch (let fetchError) {
            guard let fetchError = fetchError as? EarthquakeError else {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                error = .unknown(message: fetchError.localizedDescription)
                return isShowingError = true
            }
            error = fetchError
            isShowingError = true
        }
    }

    func canFetch() -> Bool {
        if selectedPeriod == .aMonth {
            if selectedStrength == .all {return false }
            if selectedStrength == .overMag1 { return false }
            if selectedStrength == .overMag2_5 { return false }
            if selectedStrength == .overMag4_5 { return false }
        }
        return true
    }

    func buttonLocationPresed(earthquake: Earthquake) {
        let position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: earthquake.latitude,
                    longitude: earthquake.longitude
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 5,
                    longitudeDelta: 5
                )
            )
        )
        withAnimation { self.mapPosition = position }
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
        guard let url = URL(string: urlString) else { throw EarthquakeError.invalidURL}
        let decodedEarthquakes: DecodedEarthquakes = try await httpClient.fetch(url: url, dateDecodingStrategy: .millisecondsSince1970)
        withAnimation { earthquakes = decodedEarthquakes.earthquakes }
    }
}

