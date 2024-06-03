//
//  MockHttpClient.swift
//  EarthquakesTests
//
//  Created by Ludovic HENRY on 19/02/2024.
//

import Foundation
@testable import Earthquakes


class MockHttpClient: Networking {
    var throwError: Bool = false
    var mockedData: Data?

    func fetch<T>(url: URL, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) async throws -> T where T : Decodable {
        guard !throwError else { throw HttpError.badResponse}
        guard let mockedData else { throw HttpError.invalidURL }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        guard let response = try? decoder.decode(T.self, from: mockedData) else { throw HttpError.errorDecodingData }
        return response
    }

    func getFileData(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) throws ->  Data {
        let parameter = "\(strength.rawValue)_\(period.rawValue)"
        let bundleDoingTest = Bundle(for: type(of: self ))
        let path = bundleDoingTest.path(forResource: parameter, ofType: "geojson")
        let data = try Data(contentsOf: URL(filePath: path!))
        return data
    }
}
