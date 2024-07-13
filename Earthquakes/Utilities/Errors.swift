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
    case tooManyResult(result: [Earthquake])
    case unknown(message: String)

    var errorDescription: String? {
        switch self {
        case .badUrlResponse:
            "Bad Response"
        case .failDecodingData:
            "Error Decoding Data"
        case .invalidURL:
            "Invalid URL"
        case .unknown(message: _):
            "Error Encountered"
        case .tooManyResult(result: _):
            "Result Voluminous"
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
        case .unknown(message: let message):
            message
        case .tooManyResult(result: let result):
            "\(result.count) earthquakes were found. This number is too large to be displayed. Adjust your search for a more pleasant result to consult."
        }
    }
}
