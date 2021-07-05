//
//  RequestManager.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 23.06.2021.
//

import Foundation

struct RequestManager {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func createGetRequest() -> URLRequest {
        var request = URLRequest(url: self.url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        return request
    }
}
