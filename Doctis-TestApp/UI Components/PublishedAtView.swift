//
//  PublishedAtView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

struct PublishedAtView: View {
    
    let publishedAt: String
    
    var body: some View {
        Text(publishedAt + " min ago")
            .font(.sailec(.light, size: 12))
    }
}

struct PublishedAtView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedAtView(publishedAt: "22min ago")
            .previewLayout(.sizeThatFits)
    }
}
