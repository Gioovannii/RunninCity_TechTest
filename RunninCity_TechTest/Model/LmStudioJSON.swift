//
//  mstudioJSON.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/20.
//

import Foundation

// MARK: - LmstudioJSON

struct LmStudioJSON: Codable {
    let city: String
    let isOnline: Bool
    let distance: Int
    let locations: [Location]

    enum CodingKeys: String, CodingKey {
        case city
        case isOnline = "is_online"
        case distance, locations
    }
}

// MARK: - Location

struct Location: Codable {
    let name: String
    let latitude, longitude: Double
}
