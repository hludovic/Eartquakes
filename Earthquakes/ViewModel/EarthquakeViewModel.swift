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
    private let resultLimit: Int = 300
    private(set) var earthquakes: [Earthquake] {
        didSet { navigationTitle = earthquakes.isEmpty ? "No Earthquakes loaded" : titleGenerator() }
    }
    private(set) var isLoading: Bool = false
    var filterdEarthquakes: [Earthquake] {
        guard !textSearch.isEmpty else { return earthquakes }
        return earthquakes.filter { $0.title.localizedStandardContains(textSearch) }
    }
    var selectedCell: String? { didSet { displayMapLocation(for: selectedCell) } }
    var isShowingSearchFilter: Bool = false
    var selectedPeriod: SearchFilterContent.Period = .aDay
    var selectedStrength: SearchFilterContent.Magnitude = .overMag4_5
    var isShowingError: Bool = false
    var error: EarthquakeError = .unknown(message: "")
    let httpClient: Networking
    var mapPosition: MapCameraPosition = .automatic
    var textSearch: String = ""
    var mapLocations: [MapLocation] { getMapLocations() }
    var navigationTitle = "No Earthquakes loaded"

    init(httpClient: Networking = HttpClient.shared, mockEarthquakes: [Earthquake] = []) {
        self.httpClient = httpClient
        self.earthquakes = mockEarthquakes
    }

    func fetch() async {
        isShowingSearchFilter = false
        isLoading = true
        do {
            try await fetchEarthquakes(since: paramPeriod, strength: paramStrength)
            await MainActor.run { isLoading = false }
        } catch (let fetchError) {
            guard let fetchError = fetchError as? EarthquakeError else {
                error = .unknown(message: fetchError.localizedDescription)
                isLoading = false
                return isShowingError = true
            }
            await MainActor.run { isLoading = false }
            error = fetchError
            isShowingError = true
        }
    }

    func resetMapButton() {
        selectedCell = nil
        withAnimation { mapPosition = .automatic }
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

    func titleGenerator() -> String {
        var header = ""
        var strengthString = ""
        var perodString = ""
        switch selectedStrength {
        case .all:
            strengthString = "All Earthquakes"
        case .overMag1:
            strengthString = "Magnitude 1+ Earthquakes"
        case .overMag2_5:
            strengthString = "Magnitude 2.5+ Earthquakes"
        case .overMag4_5:
            strengthString = "Magnitude 4.5+ Earthquakes"
        case .significant:
            strengthString = "Significant Earthquakes"
        }
        switch selectedPeriod {
        case .oneHour:
            perodString = ", Past Hour."
        case .aDay:
            perodString = ", Past Day."
        case .aWeek:
            perodString = ", Past 7 Days."
        case .aMonth:
            perodString = ", Past 30 Days."
        }
        header = earthquakes.isEmpty ? "" : "(\(earthquakes.count)) "
        return header + strengthString + perodString
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

    func canDisplay(earthquakes: [Earthquake]) -> Bool {
        return earthquakes.count <= resultLimit ? true : false
    }

    func displayMapLocation(for earthquakeID: String?) {
        guard let earthquakeID else { return }
        guard let earthquake = filterdEarthquakes.first(where: { $0.id == earthquakeID }) else { return }
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

    func fetchEarthquakes(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) async throws {
        let parameter = "\(strength.rawValue)_\(period.rawValue)"
        let urlString: String = ApiJsonFeeds.baseURL + ApiJsonFeeds.endpoint + "/" + parameter + "." + ApiJsonFeeds.FileFormat.json
        guard let url = URL(string: urlString) else { throw EarthquakeError.invalidURL}
        let decodedEarthquakes: DecodedEarthquakes = try await httpClient.fetch(url: url, dateDecodingStrategy: .millisecondsSince1970)
        let result = decodedEarthquakes.earthquakes
        guard canDisplay(earthquakes: result) else { throw EarthquakeError.tooManyResult(count: result.count)}
        await MainActor.run { withAnimation { earthquakes = result } }
    }

    func getMapLocations() -> [MapLocation] {
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
}

