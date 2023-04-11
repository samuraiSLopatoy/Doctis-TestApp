//
//  AnimalsListView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import SwiftUI

struct AnimalListView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    let animals: [Animal]
    
    var body: some View {
        ScrollView {
            headline
            list
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
            ForEach(animals, id: \.id) { animal in
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
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct AnimalsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                Color.backgroundMain
                    .edgesIgnoringSafeArea(.all)
                AnimalListView(animals: Animal.mockAnimals)                
            }
            .foregroundColor(.text)
            .navigationBarHidden(true)
        }
    }
}
