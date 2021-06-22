//
//  APIModel.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 22.06.2021.
//

import Foundation

struct Posts: Codable {
    let data: ItemsData
}

struct ItemsData: Codable {
    let items: [Item]
    let cursor: String
}
struct Item: Codable {
    let id: String
    let hasAdultContent: Bool
    let contents: PostData
}

struct PostData: Codable {
    
}
