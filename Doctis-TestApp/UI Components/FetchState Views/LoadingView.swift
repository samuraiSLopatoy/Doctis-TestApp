//
//  LoadingView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("🐶🐱🐰")
                .font(.system(size: 64))
            ProgressView()
            Text("Searching animals...")
                .font(.sailec(.medium, size: 20))
        }
        .padding()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
