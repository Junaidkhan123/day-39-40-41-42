//
//  CrewRole.swift
//  day-39-40-41
//
//  Created by Jhon Khan on 27/07/2020.
//

import Foundation
struct CrewRole: Codable {
    let name: String
    let role: String
}
struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // Opaque
    var displayName: String {
        "Apollo \(id)"
    }
    // same behaviour as above
    var imageName: String {
        "apollo\(id)"

    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    
}
