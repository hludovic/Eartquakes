//
//  HttpClient.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 30/01/2024.
//

import Foundation

enum MIMEType: String {
    case JSON = "application/json"
}

enum HttpHeaders: String {
    case contentType = "Content-Type"
}

enum HttpMethods: String {
    case POST, GET, PUT, DELETE

}

class HttpClient {
    private init() { }

    static let shared = HttpClient()

    func fetch<T: Decodable> (url: URL, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw HttpError.badResponse }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        guard let object = try? decoder.decode(T.self, from: data) else { throw HttpError.errorDecodingData }
        return object
    }
}
