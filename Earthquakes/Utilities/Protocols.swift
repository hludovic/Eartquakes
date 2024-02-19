//
//  Networking.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 18/02/2024.
//

import Foundation

protocol Networking {
    func fetchEarthquakes(since period: ApiJsonFeeds.Period, strength: ApiJsonFeeds.Strength) async throws
}
