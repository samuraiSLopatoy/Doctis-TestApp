//
//  ErrorView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var viewModel: AnimalsViewModel
    
    let error: String
    
    var body: some View {
        VStack(spacing: 16) { 
            Text("😿")
                .font(.system(size: 64))
            Text(error)
                .font(.sailec(.medium, size: 20))
            Button { 
                viewModel.fetchToken()
            } label: { 
                Text("Retry")
                    .font(.sailec(.medium, size: 24))
                    .foregroundColor(.projectBlue)
            }
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: AnimalsViewModel(), error: "🆘")
    }
}
