//
//  Token.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import Foundation

struct Token: Decodable {
    let tokenType: String?
    let expiresIn: Int?
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }
}
