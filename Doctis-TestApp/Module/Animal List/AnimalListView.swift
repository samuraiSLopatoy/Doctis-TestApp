//
//  AnimalsListView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import SwiftUI

struct AnimalListView: View {
    
    @ObservedObject var viewModel: AnimalsViewModel
    let animals: [Animal]
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    let onScrolledAtBottom: () -> Void
    @State private var bottomSpinnerIsAnimating: Bool = false
    
    var body: some View {
        ScrollView {
            headline
            list
            if viewModel.showBottomSpinner { customBottomSpinner }
        }
        .padding(.top, 1)
    }
    
    // MARK: - Subviews
    
    var headline: some View {
        VStack(alignment: .leading, spacing: 48) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Hey Spikey,")
                        .font(.sailec(.bold, size: 20))
                    Text("Adopt a new friend near you!")
                        .font(.sailec(.light, size: 18))
                }
                Spacer()
                Button { 
                    isDarkMode.toggle()
                } label: { 
                    Image.assetImage(.bulb)
                        .padding(.trailing)
                }
            }
            
            Text("Nearby results")
                .font(.sailec(.bold, size: 16))
        }
        .padding()
    }
    
    var list: some View {
        LazyVStack(spacing: 16) {
            ForEach(animals, id: \.uuid) { animal in
                NavigationLink { 
                    ZStack {
                        Color.backgroundDetail
                            .edgesIgnoringSafeArea(.all)
                        AnimalDetail(animal: animal)                
                    }
                    .foregroundColor(.text)
                } label: {
                    AnimalRowView(animal: animal)
                        .background(Color.backgroundDetail)
                        .foregroundColor(.text)
                        .cornerRadius(12)
                }
                // pagination logic
                .onAppear {
                    if animals.last == animal {
                        viewModel.showBottomSpinner = true
                        onScrolledAtBottom()
                    }
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
    
    var customBottomSpinner: some View {
        Text("🐶🐱🐰")
            .font(.largeTitle)
            .rotationEffect(.degrees(bottomSpinnerIsAnimating ? 180 : 0))
            .animation(.default.repeatForever(autoreverses: false),
                       value: bottomSpinnerIsAnimating)
            .onAppear { bottomSpinnerIsAnimating = true }
            .onDisappear { bottomSpinnerIsAnimating = false }
    }
}

struct AnimalsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                Color.backgroundMain
                    .edgesIgnoringSafeArea(.all)
                AnimalListView(viewModel: AnimalsViewModel(), animals: Animal.mockAnimals, onScrolledAtBottom: {})                
            }
            .foregroundColor(.text)
            .navigationBarHidden(true)
        }
    }
}
