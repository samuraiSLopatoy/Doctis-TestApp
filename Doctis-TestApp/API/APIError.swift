//
//  APIError.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import Foundation

enum APIError: LocalizedError {
    
    case invalidURL(url: URL)
    case statusCode(Int)
    case decoding(DecodingError?)
    case tokenIsEmpty
    
    // info for debugging
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url): return "🆘 " + "bad URL: \(String(describing: url))"
        case .statusCode(let statusCode): return "🆘 " + "bad response with status code: \(statusCode)"
        case .decoding(let decodingError): return "🆘 " + "decoding error: \(String(describing: decodingError))"
        case .tokenIsEmpty: return "🆘 " + "token is empty"
        }
    }
    
    // user feedback
    var userFeedbackDescription: String {
        switch self {
        case .invalidURL, .decoding, .tokenIsEmpty:
            return "Sorry, something went wrong."
        case .statusCode:
            return "Sorry, the connection to our server is failed."
        }
    }
}
