//
//  Font.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

extension Font {
    enum SailecStyle {
        case bold, medium, light  

        var value: String {
            switch self {
            case .bold: return "Sailec Bold"
            case .medium: return "Sailec Medium"
            case .light: return "Sailec Light"
            }
        }
    }
    
    static func sailec(_ type: SailecStyle, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
}
