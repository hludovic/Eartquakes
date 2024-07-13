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
    enum DisplayRange { case first, last }
    private(set) var earthquakes: [Earthquake] {
        didSet { navigationTitle = earthquakes.isEmpty ? "No Earthquakes loaded" : titleGenerator() }
    }
    var filterdEarthquakes: [Earthquake] {
        guard !textSearch.isEmpty else { return earthquakes }
        return earthquakes.filter { $0.title.localizedStandardContains(textSearch) }
    }
    private(set) var isLoading: Bool = false
    var isShowingSearchView: Bool = false
    var isShowingInspector = false
    var isShowingError: Bool = false
    var isInspectorDisabled: Bool {
        guard !isShowingInspector else { return false }
        return selectedCell == nil ? true : false
    }
    var selectedCell: Earthquake? { didSet { displayMapLocation(for: selectedCell?.id) } }
    var selectedPeriod: SearchFilterContent.Period = .aDay
    var selectedStrength: SearchFilterContent.Magnitude = .overMag4_5
    var error: EarthquakeError = .unknown(message: "") { didSet { isShowingError = true } }
    var mapPosition: MapCameraPosition = .automatic
    var textSearch: String = ""
    var navigationTitle = "No Earthquakes loaded"
    let httpClient: Networking

    init(httpClient: Networking = HttpClient.shared, mockEarthquakes: [Earthquake] = []) {
        self.httpClient = httpClient
        self.earthquakes = mockEarthquakes
    }

    func pressSearchButton() async {
        var fetchResult: [Earthquake] = []
        isShowingSearchView = false
        withAnimation { isLoading = true }
        do {
            fetchResult = try await fetchEarthquakes(since: paramPeriod, strength: paramStrength)
            withAnimation { isLoading = false }
        } catch (let fetchError) {
            guard let fetchError = fetchError as? EarthquakeError else {
                withAnimation { isLoading = false }
                return error = .unknown(message: fetchError.localizedDescription)
            }
            withAnimation { isLoading = false }
            error = fetchError
        }
        guard fetchResult.count <= Constants.resultLimit else { return error = EarthquakeError.tooManyResult(result: fetchResult) }
        displayEarthquakes(result: fetchResult)
    }

    func displayEarthquakes(result: [Earthquake], range: DisplayRange = .first) {
        selectedCell = nil
        if range == .first {
            guard result.count >= Constants.resultLimit else { return withAnimation { self.earthquakes = result } }
            withAnimation { self.earthquakes = Array(result[...(Constants.resultLimit - 1)]) }
        } else if range == .last {
            guard result.count >= Constants.resultLimit else { return withAnimation { self.earthquakes = result } }
            let firstBound = ((result.count - 1) - (Constants.resultLimit - 1))
            let lastBound = result.count - 1
            withAnimation { self.earthquakes = Array(result[firstBound...lastBound]) }
        }
    }

    func pressResetMapButton() {
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
        return strengthString + perodString
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

    func displayMapLocation(for earthquakeID: String?) {
        guard let earthquakeID else { return }
        guard let earthquake = filterdEarthquakes.first(where: { $0.id == earthquakeID }) else { return }

        let position: MapCameraPosition = .camera(
            MapCamera(
                centerCoordinate: CLLocationCoordinate2D(
                    latitude: earthquake.latitude,
                    longitude: earthquake.longitude
                ),
                distance: Constants.mapCameraDistance
            )
        )
        withAnimation { self.mapPosition = position }
    }

    func fetchEarthquakes(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) async throws -> [Earthquake] {
        let parameter = "\(strength.rawValue)_\(period.rawValue)"
        let urlString: String = ApiJsonFeeds.baseURL + ApiJsonFeeds.endpoint + "/" + parameter + "." + ApiJsonFeeds.FileFormat.json
        guard let url = URL(string: urlString) else { throw EarthquakeError.invalidURL}
        let decodedEarthquakes: DecodedEarthquakes = try await httpClient.fetch(url: url, dateDecodingStrategy: .millisecondsSince1970)
        return decodedEarthquakes.earthquakes
    }
}
