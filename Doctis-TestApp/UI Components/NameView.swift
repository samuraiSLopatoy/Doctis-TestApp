//
//  NameView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

struct NameView: View {
    
    let name: String?
    
    enum FontSize {
        case small, large
    }
    
    var fontSize: FontSize = .small
    
    var body: some View {
        switch fontSize {
        case .small:
            Text(name ?? "No name")
                .font(.sailec(.medium, size: 16))
                .lineLimit(1)
        case .large:
            Text(name ?? "No name")
                .font(.sailec(.bold, size: 24))
                .lineLimit(1)
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(name: "Parkinson")
            .previewLayout(.sizeThatFits)
    }
}
