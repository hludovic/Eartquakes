//
//  MockHttpClient.swift
//  EarthquakesTests
//
//  Created by Ludovic HENRY on 19/02/2024.
//

import Foundation
@testable import Earthquakes

typealias MockRequest = (throwError: HttpError?, period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength)

class MockHttpClient: Networking {
    var mockRequest: MockRequest?

    func fetch<T>(url: URL, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) async throws -> T where T : Decodable {
        guard let mockRequest = mockRequest else { throw HttpError.invalidURL }
        guard (mockRequest.throwError == nil) else { throw mockRequest.throwError! }
        guard let mockResponse = try? getFileData(request: mockRequest) else { throw HttpError.invalidURL }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        guard let response = try? decoder.decode(T.self, from: mockResponse) else { throw HttpError.errorDecodingData }
        return response
    }

    private func getFileData(request: MockRequest) throws ->  Data {
        let parameter = "\(request.strength.rawValue)_\(request.period.rawValue)"
        let bundleDoingTest = Bundle(for: type(of: self ))
        let path = bundleDoingTest.path(forResource: parameter, ofType: "geojson")
        let data = try Data(contentsOf: URL(filePath: path!))
        return data
    }
}
