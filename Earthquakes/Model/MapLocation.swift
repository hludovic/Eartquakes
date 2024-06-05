//
//  MapLocation.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 04/06/2024.
//

import Foundation
import MapKit

struct MapLocation: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
