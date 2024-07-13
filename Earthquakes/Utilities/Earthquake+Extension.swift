//
//  Earthquake+Extension.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 10/07/2024.
//

import Foundation
import MapKit

extension Earthquake {
    /// Instantiate and returns a `CLLocationCoordinate2D` that includes the longitude and latitude of the earthquake.
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    /// Returns a radius for the point that serves as an annotation to the Earthquake on the map.
    var mapItemRadius: CGFloat {
        switch magnitude {
        case ..<1:
            return 10
        case 1..<2:
            return 15
        case 2..<3:
            return 20
        case 3..<4:
            return 25
        case 4..<5:
            return 30
        case 5...:
            return 35
        default:
            return 70
        }
    }
}
