//
//  Image.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

extension Image {
    enum ProjectImage: String {
        case bulb, pin, messangerButton, leftArrow, heart
    }
    
    static func assetImage(_ name: ProjectImage) -> Image {
        return Image(name.rawValue)
    }
}
