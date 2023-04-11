//
//  AnimalsViewModel.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import Foundation
import Combine

final class AnimalsViewModel: ObservableObject {
    
    @Published var animals: [Animal] = []
    @Published var fetchState: FetchState = .noResults
    
    private let authService = AuthService()
    private let animalService = AnimalService()
    
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        fetchAnimals()
    }
    
    func fetchAnimals() {
        fetchState = .isLoading
        
        let tokenPublisher = authService.getAccessToken()
        tokenPublisher
            .flatMap { [weak self] token -> AnyPublisher<Response, Error> in
                if let token = token.accessToken, let self = self {
                    let animalsPublisher = self.animalService.getAnimals(token: token)
                    return animalsPublisher
                } else {
                    return Fail(error: APIError.tokenIsEmpty).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error as APIError) = completion {
                        self?.fetchState = .error(error)
                    }
                },
                receiveValue: { [weak self] response in
                    let animals = response.animals ?? []
                    self?.animals = animals
                    self?.fetchState = animals.isEmpty ? .noResults : .loadedAll
                })
            .store(in: &subscribers)
    }
}
