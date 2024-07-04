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
        mockHttpClient.updateMockRequest(period: .aMonth, strength: .significant)

        viewModel.selectedPeriod = .aMonth
        viewModel.selectedStrength = .significant
        await viewModel.fetch()
        XCTAssertEqual(viewModel.earthquakes.count, 12)
    }

    func testFetchingDataWithError() async throws {
        mockHttpClient.updateMockRequest(throwError: .badUrlResponse, period: .aMonth, strength: .significant)

        viewModel.selectedPeriod = .aMonth
        viewModel.selectedStrength = .significant
        await viewModel.fetch()
        
        XCTAssertTrue(viewModel.isShowingError)
        XCTAssertEqual(viewModel.error.errorDescription, EarthquakeError.badUrlResponse.errorDescription)
    }
}
