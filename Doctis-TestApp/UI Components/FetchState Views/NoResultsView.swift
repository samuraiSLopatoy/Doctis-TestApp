//
//  NoResultsView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("😿")
                .font(.system(size: 64))
            Text("No results.")
                .font(.sailec(.medium, size: 20))
        }
        .padding()
    }
}

struct NoResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultsView()
    }
}
