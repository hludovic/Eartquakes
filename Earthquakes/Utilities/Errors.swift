//
//  Errors.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

import Foundation

enum HttpError: Error {
    case badResponse
    case errorDecodingData
    case invalidURL
}

extension HttpError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badResponse:
            "Bad Response"
        case .errorDecodingData:
            "Error Decoding Data"
        case .invalidURL:
            "Invalid URL"
        }
    }

    var failureReason: String? {
        switch self {
        case .badResponse:
            "An error occurred when receiving the data."
        case .errorDecodingData:
            "An error occurred while processing the data."
        case .invalidURL:
            "Unable to communicate with the server."
        }
    }
}
