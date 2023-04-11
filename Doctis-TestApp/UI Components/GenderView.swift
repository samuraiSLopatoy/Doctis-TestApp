//
//  GenderView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI

struct GenderView: View {
    
    let gender: Gender?
    
    var body: some View {
        Text(gender?.rawValue ?? "Unknown")
            .font(.sailec(.light, size: 12))
            .foregroundColor(gender == .male ? Color.projectBlue : .projectRed)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(gender == .male ? Color.projectBlue.opacity(0.1) : .projectRed.opacity(0.1))
            )
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView(gender: .male)
            .previewLayout(.sizeThatFits)
    }
}
