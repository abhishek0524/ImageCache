//
//  ApiResponse.swift
//  ImageLoad
//
//  Created by apple on 16/04/24.
//

import Foundation

//struct ApiResponse: Decodable {
//    let values: [values]
//}

struct ApiResponse: Decodable {
    
    let links: Links
    enum CodingKeys: String, CodingKey {
        case links = "links"
    }
}

// MARK: - Datum
struct Links: Decodable {
    let download: String
}

