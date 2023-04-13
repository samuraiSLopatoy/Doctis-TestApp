//
//  Animal.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import Foundation

// MARK: - Response

struct Response: Decodable {
    let animals: [Animal]?
    let pagination: Pagination?
}

// MARK: - Animal

struct Animal: Decodable, Equatable {
    
    let uuid: UUID = UUID() // for work optimizing of LazyVStack
    
    let id: Int?
    let colors: Colors?
    let age: Age?
    let gender: Gender?
    let size: Size?
    let tags: [String]?
    let name: String?
    let description: String?
    let primaryPhotoCropped: Photo?
    let publishedAt: Date?
    let distance: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, colors, age, gender, size, tags, name, description, distance
        case primaryPhotoCropped = "primary_photo_cropped"
        case publishedAt = "published_at"
    }
    
    // MARK: Convenience properties
    
    var smallPhotoURL: String? {
        primaryPhotoCropped?.small
    }
    var largePhotoURL: String? {
        primaryPhotoCropped?.large
    }
    var publishedAtString: String {
        if let publishedAt = publishedAt {
            return DateFormatter.projectDateFormatter.string(from: publishedAt)
        } else {
            return "0"
        }
    }
    
    // MARK: Mock
    
    static let mockAnimals: [Self] = [
        Animal(id: 1, 
               colors: Colors(primary: "White", 
                              secondary: nil,
                              tertiary: nil), 
               age: .senior, 
               gender: .female, 
               size: .extraLarge, 
               tags: ["Playful"],
               name: "Parkinson", 
               description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.END!", 
               primaryPhotoCropped: Photo(small: "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62373180/1/?bust=1681035002&width=300", 
                                          medium: "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62373180/1/?bust=1681035002&width=450", 
                                          large: "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62418993/1/?bust=1681119243&width=600", 
                                          full: "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62373180/1/?bust=1681035002"), 
               publishedAt: Date(), 
               distance: 182)
    ]
    
    // MARK: - Equatable
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Age

enum Age: String, Decodable {
    case adult = "Adult"
    case baby = "Baby"
    case senior = "Senior"
    case young = "Young"
}

// MARK: - Colors

struct Colors: Decodable {
    let primary: String?
    let secondary: String?
    let tertiary: String?
}

// MARK: - Gender

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "Unknown"
}

// MARK: - Photo

struct Photo: Decodable {
    let small, medium, large, full: String?
}

// MARK: - Size

enum Size: String, Decodable {
    case extraLarge = "Extra Large"
    case large = "Large"
    case medium = "Medium"
    case small = "Small"
}

// MARK: - Pagination

struct Pagination: Decodable {
    let countPerPage: Int?
    let totalCount: Int?
    let currentPage: Int?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case countPerPage = "count_per_page"
        case totalCount = "total_count"
        case currentPage = "current_page"
        case totalPages = "total_pages"
    }
}
