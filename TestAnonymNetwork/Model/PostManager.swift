//
//  PostManager.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 23.06.2021.
//

import Foundation

protocol PostManagerDelegate: class {
    func didFinishCreatePosts(posts: [Post])
}

class PostManager {
    static let urlPostStringFirst = "http://localhost:8000/test.json"
    static let urlPostStringAfter = "https://k8s-stage.apianon.ru/posts/v1/posts/?after=parameter"
    static let urlPosts = "https://k8s-stage.apianon.ru/posts/v1/posts/"
    var session: URLSession = {
        let confiruration = URLSessionConfiguration.default
        confiruration.waitsForConnectivity = true
        return URLSession(configuration: confiruration)
    }()
    
    weak var delegate: PostManagerDelegate?
    var cursorsArray: [String] = []
    var urlTasks: [String] = []
    
    func fetchPosts(cursor: String = "") {
        let stringUrl: String
        if cursor.isEmpty {
            stringUrl = PostManager.urlPostStringFirst
        } else {
            stringUrl = PostManager.urlPostStringFirst
        }
        
        if let urlPost = URL(string: stringUrl) {
            let requestManager = RequestManager(url: urlPost)
            let postGetRequest = requestManager.createGetRequest()
            
            let task = session.dataTask(with: postGetRequest) { (data, responce, error) in
                if error != nil {
                    print("1 \(error)")
                }
                
                if let httpResponce = responce as? HTTPURLResponse {
                    if (200...299).contains(httpResponce.statusCode) {
                        if let safeData = data {
                            self.parseData(data: safeData)
                        }
                    }else {
                        print("2 \(error)")
                    }
                }
            }
            task.resume()
            
        } else {
           print("error")
        }
        
    }
    
    func parseData(data: Data) {
        var posts = [Post]()
        let decoder = JSONDecoder()
        do {
            
            let decoderData = try decoder.decode(Posts.self, from: data)
        
            //cursor
            if let cursor = decoderData.data.cursor {
                if cursorsArray.contains(cursor) {
                    return
                }
                Cursor.cursor = cursor
            }else {
                return
            }
        
            for item in decoderData.data.items{
                let post = Post()
                for content in item.contents {
                    
                    switch content.type {
                    case .TEXT:
                        if let header = content.data.value {
                            post.headerText = header
                        }
                    case .IMAGE:
                        if let smallImage = content.data.extraSmall {
                            post.content[ContentType.IMAGE] = smallImage.url
                            post.urlContent = smallImage.url
                            post.contentType = .IMAGE
                        }
                    case .IMAGE_GIF:
                        if let smallImage = content.data.extraSmall {
                            post.content[ContentType.IMAGE_GIF] = smallImage.url
                            post.urlContent = smallImage.url
                            post.contentType = .IMAGE_GIF
                        }
                    case .AUDIO:
                        if let urlAudio = content.data.url {
                            post.content[ContentType.AUDIO] = urlAudio
                            post.urlContent = urlAudio
                            post.contentType = .AUDIO
                        }
                    default:
                        post.urlContent = ""
                    }
                }
                if let author = item.author {
                    post.authorName = author.name
                }
                
                post.postStatistic[PostStatiscticType.views] = item.stats.views.count
                post.postStatistic[PostStatiscticType.likes] = item.stats.likes.count
                post.postStatistic[PostStatiscticType.comments] = item.stats.comments.count
                
                posts.append(post)

            }
            delegate?.didFinishCreatePosts(posts: posts)
        }catch {
            print(error)
        }
    }
}
