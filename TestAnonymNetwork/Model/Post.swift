//
//  Post.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 22.06.2021.
//

import Foundation

class Post {
    var authorName: String?
    var headerText: String?
    var content: [ContentType: String]
    var urlContent: String?
    var contentType: ContentType
    var postStatistic: [PostStatiscticType: Int]
    
    init() {
        self.contentType = .TEXT
        self.content = [:]
        self.postStatistic = [:]
    }
}

enum PostStatiscticType {
    case likes
    case views
    case comments
}
