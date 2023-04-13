//
//  ContentView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AnimalsViewModel()
    
    var body: some View {
        switch viewModel.fetchState {
        case .initial:
            EmptyView()
        case .isLoading:
            LoadingView()
        case .loadedAll:
            AnimalListView(viewModel: viewModel, 
                           animals: viewModel.animals, 
                           onScrolledAtBottom: {
                guard viewModel.currentPage != viewModel.nextPage else { return }
                viewModel.fetchAnimals()
            })
        case .error(let error):
            ErrorView(viewModel: viewModel, 
                      error: (error as! APIError).userFeedbackDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
