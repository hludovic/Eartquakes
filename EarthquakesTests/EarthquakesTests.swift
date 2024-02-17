//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Ludovic HENRY on 15/02/2024.
//

import XCTest
@testable import Earthquakes

final class EarthquakesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModel() async throws {
        let viewModel = EarthquakeViewModel()
        XCTAssertEqual(viewModel.earthquakes.count, 0)
        try await viewModel.fetchEarthquakes(since: .aDay, strength: .all)
        XCTAssertNotEqual(viewModel.earthquakes.count, 0)
    }
}
