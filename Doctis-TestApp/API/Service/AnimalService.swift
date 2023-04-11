//
//  AnimalService.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import Foundation
import Combine

struct AnimalService {
    
    func getAnimals(token: String) -> AnyPublisher<Response, Error> {
        var urlRequest: URLRequest!
        
        do { urlRequest = try createAnimalsRequest(token: token) }
        catch {
            print(error.localizedDescription)
        }
        
        return NetworkManager.dataTask(for: urlRequest)
            .tryMap { data -> Response in
                do { 
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    return try decoder.decode(Response.self, from: data) 
                } 
                catch { 
                    let error = APIError.decoding(error as? DecodingError)
                    print(error.localizedDescription)
                    throw error
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func createAnimalsRequest(token: String) throws -> URLRequest {
        var components: URLComponents = .init()
        components.scheme = "https"
        components.host = APIConstant.host
        components.path = "/v2/animals"
        
        guard let url = components.url else {
            throw APIError.invalidURL(url: components.url!)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(["Bearer", token].joined(separator: " "), forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = NetworkManager.HTTPMethod.get.rawValue
        
        return urlRequest
    }
}
