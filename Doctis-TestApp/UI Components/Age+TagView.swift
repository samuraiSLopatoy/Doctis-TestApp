//
//  Age+TagView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

struct Age_TagView: View {
    
    let age: Age?
    let tags: [String]?
    
    var body: some View {
        Text((age?.rawValue ?? "Age unknown") + " | " + (tags?.first ?? "No tag"))
            .font(.sailec(.light, size: 12))
    }
}

struct Age_TagView_Previews: PreviewProvider {
    static var previews: some View {
        Age_TagView(age: .senior, tags: ["Playful"])
            .previewLayout(.sizeThatFits)
    }
}
