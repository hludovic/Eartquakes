//
//  Errors.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 17/02/2024.
//

enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}
