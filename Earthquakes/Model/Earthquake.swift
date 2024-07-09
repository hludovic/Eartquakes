//
//  Earthquake.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 30/01/2024.
//

import Foundation

struct Earthquake: Identifiable, Hashable {
    let id: String
    let magnitude: Float
    let place: String
    let time: Date
    let updated: Date
    let url: String
    let alert: String?
    let tsunami: Int
    let sig: Int
    let type: String
    let title: String
    let longitude: Double
    let latitude: Double
    let depth: Double
    let status: String
}
