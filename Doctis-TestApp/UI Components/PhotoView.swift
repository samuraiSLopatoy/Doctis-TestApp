//
//  PhotoView.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import SwiftUI
import Kingfisher

struct PhotoView: View {
    
    let photoURL: String?
    
    enum PhotoSize {
        case small, large
    }
    
    var photoSize: PhotoSize = .small
    
    var body: some View {
        if let photoURL = photoURL {
            switch photoSize {
            case .small:
                KFImage(URL(string: photoURL))
                    .placeholder { ProgressView() }
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            case .large:
                KFImage(URL(string: photoURL))
                    .placeholder { ProgressView() }
                    .resizable()
                    .scaledToFit()
            }
        } else {
            switch photoSize {
            case .small:
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 100)
            case .large:
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, 
                           height: UIScreen.main.bounds.height / 3)
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photoURL: Animal.mockAnimals.first!.smallPhotoURL)
    }
}
