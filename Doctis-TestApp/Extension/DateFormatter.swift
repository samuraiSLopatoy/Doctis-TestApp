//
//  DateFormatter.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 10.04.2023.
//

import Foundation

extension DateFormatter {
    static let projectDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "mm"
        return df
    }()
}
