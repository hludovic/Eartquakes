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

    func testExample() async throws {
        let urlString: String = ApiJsonFeeds.baseURL + ApiJsonFeeds.endpoint + "/" + ApiJsonFeeds.Parameters.month_significant + "." + ApiJsonFeeds.FileFormat.json
        XCTAssertEqual(urlString, "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.geojson")
        let url = URL(string: urlString)!
        print(url)

        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return print("BAD RESPONSE") }
        guard let obj = try? JSONDecoder().decode(Earthquake.self, from: data) else { return print("ERROR DECODE") }
        print(obj)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
