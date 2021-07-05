//
//  APIModel.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 22.06.2021.
//

import Foundation

//MARK: - main struct API
struct Posts: Codable {
    let data: ItemsData
}

struct ItemsData: Codable {
    let items: [Item]
    let cursor: String?
}
struct Item: Codable {
    let id: String
    let hasAdultContent: Bool
    let contents: [PostData]
    let author: Author?
    let stats: PostStatistics
}

//MARK: - contents
enum ContentType: String, Codable {
    case TEXT
    case IMAGE_GIF
    case IMAGE
    case VIDEO
    case AUDIO
    case TAGS
}

struct PostData: Codable {
    
    let type: ContentType // text, image, video case?
    let id: String?
    let data: ContentData
    
}

struct ContentData: Codable {
    let value: String?
    let extraSmall: ImageData?
    let url: String?
}

struct ImageData: Codable {
    let url: String
    let size: SizeImageData
}

struct SizeImageData: Codable {
    let width: Int
    let height: Int
}

//MARK: - author
struct Author: Codable {
    let id: String
    let name: String
    let gender: String //case?
    //let statistics: AuthorStatistics
}
struct AuthorStatistics: Codable {
    let likes: Int?
    let thanks: Int?
}

//MARK: - stats
struct PostStatistics: Codable {
    let likes: PostStatisticsCount
    let views: PostStatisticsCount
    let comments: PostStatisticsCount
}

struct PostStatisticsCount: Codable {
    let count: Int
    let my: Bool
}

