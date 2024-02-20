//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Ludovic HENRY on 15/02/2024.
//

import XCTest
@testable import Earthquakes

final class EarthquakesTests: XCTestCase {
    var viewModel: EarthquakeViewModel!
    var mockHttpClient: MockHttpClient!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockHttpClient = MockHttpClient()
        viewModel = EarthquakeViewModel(httpClient: mockHttpClient)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockHttpClient = nil
        try super.tearDownWithError()
    }

    func testFetchingDataSuccessfully() async throws {
        XCTAssertEqual(viewModel.earthquakes.count, 0)
        let mockedData = try mockHttpClient.getFileData(since: .aMonth, strength: .significant)
        
        mockHttpClient.throwError = false
        mockHttpClient.mockedData = mockedData

        try await viewModel.fetchEarthquakes(since: .aMonth, strength: .significant)
        XCTAssertEqual(viewModel.earthquakes.count, 12)
    }

    func testFetchingDataWithError() async throws {
        mockHttpClient.throwError = true

        do {
            try await viewModel.fetchEarthquakes(since: .aMonth, strength: .significant)
        } catch let error {
            XCTAssertEqual(error as! HttpError, HttpError.badResponse)
        }
    }
}
