//
//  PostsViewController.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 17.06.2021.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PostManagerDelegate, UITableViewDataSourcePrefetching {
    

    //MARK: - Intesface
    private var postsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .singleLine
        table.register(PostTableCell.self, forCellReuseIdentifier: "PostCell")
        return table
    }()
    
    var posts = [Post]()
    var postManager = PostManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Posts"
        self.navigationController?.navigationBar.prefersLargeTitles = true
     
        self.view.addSubview(postsTableView)
        setPostsTableViewConstraints()
        
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.prefetchDataSource = self
        
        postManager.delegate = self
        postManager.fetchPosts()
    }
    
    //PREFETCH
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths[indexPaths.count-1].row == posts.count - 1 {
            self.postManager.fetchPosts(cursor: Cursor.cursor)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
       // print("cancelPrefetchingForRowsAt \(indexPaths)")
    }
    func didFinishCreatePosts(posts: [Post]) {
        self.posts += posts
        self.postManager.cursorsArray.append(Cursor.cursor)
        print(Cursor.cursor)
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
            print(posts.count)
        }
        
    }
    
    func setPostsTableViewConstraints() {
        let constrains = [
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postsTableView.topAnchor.constraint(equalTo: view.topAnchor)]
        NSLayoutConstraint.activate(constrains)
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableCell
        
        let post = posts[indexPath.row]
        
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layer.cornerRadius = 2
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        //cell.clipsToBounds = true
        
        cell.setVar(post: post)
     
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
       //return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = PostViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
