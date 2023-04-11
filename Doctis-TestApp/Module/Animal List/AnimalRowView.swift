//
//  AnimalRowView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import SwiftUI

struct AnimalRowView: View {
    
    let animal: Animal
    
    var body: some View {
        HStack(spacing: 16) {
            // 1
            PhotoView(photoURL: animal.smallPhotoURL, photoSize: .small)
                .cornerRadius(12)
            // 2
            metaInfo
        }
        .padding()
    }
    
    // MARK: - Subviews
    
    var metaInfo: some View {
        HStack {
            firstVStack
            Spacer()
            secondVStack                
        }
        .padding(.vertical, 8)
    }
    
    var firstVStack: some View {
        VStack(alignment: .leading) {
            NameView(name: animal.name, fontSize: .small)
            Spacer()
            Age_TagView(age: animal.age, tags: animal.tags)
            Spacer()
            DistanceView(distance: animal.distance)
        }
    }
    
    var secondVStack: some View {
        VStack(alignment: .trailing) {
            GenderView(gender: animal.gender)
            Spacer()
            PublishedAtView(publishedAt: animal.publishedAtString)
        }
    }
}

struct AnimalRowView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalRowView(animal: Animal.mockAnimals.first!)
    }
}
