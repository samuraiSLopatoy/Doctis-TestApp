//
//  NetworkManager.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import Foundation
import Combine

final class NetworkManager {
    
    static func dataTask(for URLRequest: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: URLRequest)
            .tryMap { try handleResponse(output: $0) }
            .retry(2)
            .eraseToAnyPublisher()
    }
    
    private static func handleResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        if let response = output.response as? HTTPURLResponse,
           !(200...299).contains(response.statusCode) {
            throw APIError.statusCode(response.statusCode)
        } else {
            return output.data
        }
    }
}

extension NetworkManager {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
}
