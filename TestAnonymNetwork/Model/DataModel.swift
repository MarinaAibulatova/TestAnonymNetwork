//
//  DataModel.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 25.06.2021.
//

import Foundation

class DataModel: PostManagerDelegate {
    
    var posts = [Post]()
    var postManager = PostManager()
    
    init() {
        postManager.delegate = self
        self.loadPosts()
    }
    
    func loadPosts() {
        postManager.fetchPosts()
    }
    
    func didFinishCreatePosts(posts: [Post]) {
        
    }
}
