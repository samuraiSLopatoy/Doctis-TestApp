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
        case .isLoading:
            LoadingView()
        case .loadedAll:
            AnimalListView(animals: viewModel.animals)
        case .noResults:
            NoResultsView()
        case .error(let error):
            ErrorView(error: (error as! APIError).userFeedbackDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
