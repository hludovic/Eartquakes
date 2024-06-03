//
//  EarthquakeViewModel.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

import Foundation
import Observation

@Observable final class EarthquakeViewModel {
    var earthquakes: [Earthquake] = []
    var selectedPeriod: ApiJsonFeeds.Period = .aMonth
    var selectedStrength: ApiJsonFeeds.Strength = .significant
    var errorMessage: String = ""
    let httpClient: Networking

    init(httpClient: Networking = HttpClient.shared) { self.httpClient = httpClient }

    func fetch() async {
        do {
            try await fetchEarthquakes(since: selectedPeriod, strength: selectedStrength)
        } catch (let error) {
            errorMessage = error.localizedDescription
        }
    }
}

private extension EarthquakeViewModel {

    func fetchEarthquakes(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) async throws {
        let parameter = "\(strength.rawValue)_\(period.rawValue)"
        let urlString: String = ApiJsonFeeds.baseURL + ApiJsonFeeds.endpoint + "/" + parameter + "." + ApiJsonFeeds.FileFormat.json
        guard let url = URL(string: urlString) else { throw HttpError.invalidURL}
        let decodedEarthquakes: DecodedEarthquakes = try await httpClient.fetch(url: url, dateDecodingStrategy: .millisecondsSince1970)
        earthquakes = decodedEarthquakes.earthquakes
    }
}

