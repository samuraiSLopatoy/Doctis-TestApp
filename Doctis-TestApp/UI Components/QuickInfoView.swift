//
//  QuickInfoView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

struct QuickInfoView: View {
    
    let value: String?
    let parameter: Parameter
    
    enum Parameter: String {
        case age = "Age"
        case color = "Color"
        case weight = "Weight"
    }
    
    var body: some View {
        ZStack {
            Color.backgroundMain
            VStack(spacing: 4) {
                switch parameter {
                case .age:
                    Text(value ?? "Unknown")
                        .font(.sailec(.medium, size: 16))
                case .color:
                    Text(value ?? "Unknown")
                        .font(.sailec(.medium, size: 16))
                case .weight:
                    Text(value ?? "Unknown")
                        .font(.sailec(.medium, size: 16))
                }
                
                Text(parameter.rawValue)
                    .font(.sailec(.light, size: 10))
            }
            .padding()
        }
        .cornerRadius(12)
    }
}

struct QuickInfoView_Previews: PreviewProvider {
    static var previews: some View {
        QuickInfoView(value: "Brown", parameter: .color)
            .previewLayout(.sizeThatFits)
    }
}
