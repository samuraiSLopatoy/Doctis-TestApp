//
//  AnimalsViewModel.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import Foundation
import Combine

final class AnimalsViewModel: ObservableObject {
    
    @Published var fetchState: FetchState = .initial
    private var subscriptions: Set<AnyCancellable> = []
    
    // meta
    private var token: String = ""
    @Published var animals: [Animal] = []
    
    // pagination
    var currentPage: Int = 0
    var nextPage: Int = 1
    private var canLoadNextPage: Bool = true
    @Published var showBottomSpinner: Bool = false
    
    // services
    private let authService = AuthService()
    private let animalService = AnimalService()
    
    init() {
        fetchToken()
    }
    
    func fetchAnimals() {
        guard canLoadNextPage else {
            showBottomSpinner = false
            return 
        }
        
        let animalsPublisher = animalService.getAnimals(token: token, page: nextPage)
        animalsPublisher
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.showBottomSpinner = false
                        self?.fetchState = .loadedAll
                    case .failure(let error):
                        self?.fetchState = .error(error as! APIError)
                    }
                }, 
                receiveValue: { [weak self] response in
                    // pagination
                    let currentPage = response.pagination?.currentPage ?? 0
                    self?.currentPage = currentPage
                    self?.nextPage = currentPage + 1
                    // animals
                    let animals = response.animals ?? []
                    self?.animals.append(contentsOf: animals)
                    self?.canLoadNextPage = !animals.isEmpty
                })
            .store(in: &subscriptions)
    }
    
    func fetchToken() {
        fetchState = .isLoading
        
        let tokenPublisher = authService.getAccessToken()
        tokenPublisher
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.fetchAnimals()
                    case .failure(_):
                        self?.fetchState = .error(APIError.invalidToken)
                    }
                },
                receiveValue: { [weak self] token in
                    let token = token.accessToken ?? ""
                    self?.token = token
                })
            .store(in: &subscriptions)
    }
}
