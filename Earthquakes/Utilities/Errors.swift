//
//  Errors.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

import Foundation

enum EarthquakeError: LocalizedError {
    case badUrlResponse
    case failDecodingData
    case invalidURL
    case cantFetch
    case unknown(message: String)

    var errorDescription: String? {
        switch self {
        case .badUrlResponse:
            "Bad Response"
        case .failDecodingData:
            "Error Decoding Data"
        case .invalidURL:
            "Invalid URL"
        case .cantFetch:
            "Invalid Request"
        case .unknown(message: _):
            "Error Encountered"
        }
    }

    var failureReason: String {
        switch self {
        case .badUrlResponse:
            "An error occurred when receiving the data."
        case .failDecodingData:
            "An error occurred while processing the data."
        case .invalidURL:
            "Unable to communicate with the server."
        case .cantFetch:
            "The request is invalid or has been blocked."
        case .unknown(message: let message):
            message
        }
    }
}
