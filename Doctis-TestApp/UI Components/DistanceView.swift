//
//  DistanceView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

struct DistanceView: View {
    
    let distance: Int?
    
    var body: some View {
        HStack(spacing: 8) {
            Image.assetImage(.pin)
            Text("\(distance ?? 0)m away")
                .font(.sailec(.light, size: 12))
        }
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView(distance: 182)
            .previewLayout(.sizeThatFits)
    }
}
