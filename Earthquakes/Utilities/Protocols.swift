//
//  Networking.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 18/02/2024.
//

import Foundation

protocol Networking {
    func fetch<T: Decodable> (url: URL, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) async throws -> T
}
