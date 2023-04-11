//
//  AuthService.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import Foundation
import Combine

struct AuthService {
    
    func getAccessToken() -> AnyPublisher<Token, Error> {
        var urlRequest: URLRequest!
        
        do { urlRequest = try createAccessTokenRequest() }
        catch {
            print(error.localizedDescription)
        }
        
        return NetworkManager.dataTask(for: urlRequest)
            .tryMap { data -> Token in
                do { 
                    return try JSONDecoder().decode(Token.self, from: data)
                }
                catch { 
                    let error = APIError.decoding(error as? DecodingError)
                    print(error.localizedDescription)
                    throw error
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func createAccessTokenRequest() throws -> URLRequest {
        var components: URLComponents = .init()
        components.scheme = "https"
        components.host = APIConstant.host
        components.path = "/v2/oauth2/token"
        
        guard let url = components.url else {
            throw APIError.invalidURL(url: components.url!)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = NetworkManager.HTTPMethod.post.rawValue
        
        let bodyDataParams: [String: String] = [
            "grant_type": "client_credentials",
            "client_id": APIConstant.clientId,
            "client_secret": APIConstant.clientSecret
        ]
        
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyDataParams)
        
        return urlRequest
    }
}
