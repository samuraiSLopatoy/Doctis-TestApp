//
//  FetchState.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import Foundation

enum FetchState {
    case initial
    case isLoading
    case loadedAll
    case error(Error)
}
