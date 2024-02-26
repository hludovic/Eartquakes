//
//  EarthquakeViewModel.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

import Foundation

class EarthquakeViewModel: ObservableObject {
    @Published var earthquakes: [Earthquake] = []
    let httpClient: Networking

    init(httpClient: Networking = HttpClient.shared) { self.httpClient = httpClient }

    func fetchEarthquakes(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) async throws {
        guard let url = getGeoJSONFeedUrl(since: period, strength: strength) else { throw HttpError.invalidURL}
        let decodedEarthquakes: DecodedEarthquakes = try await httpClient.fetch(url: url, dateDecodingStrategy: .millisecondsSince1970)
        earthquakes = decodedEarthquakes.earthquakes
    }
}

private extension EarthquakeViewModel {

    func getGeoJSONFeedUrl(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) -> URL? {
        let parameter = ApiJsonFeeds.parameters(period: period, strength: strength)
        let urlString: String = ApiJsonFeeds.baseURL + ApiJsonFeeds.endpoint + "/" + parameter + "." + ApiJsonFeeds.FileFormat.json
        return URL(string: urlString)
    }
}

