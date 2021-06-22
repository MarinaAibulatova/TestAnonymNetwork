//
//  PostsViewController.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 17.06.2021.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    //MARK: - Intesface
   // @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var label: UILabel?
    
    
    
    private var data = ["1", "2", "3"]
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Table"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        //myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView = UITableView()
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.separatorStyle = .singleLine
        self.view.addSubview(myTableView)
        
        let constrains = [
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myTableView.topAnchor.constraint(equalTo: view.topAnchor)]
        NSLayoutConstraint.activate(constrains)
        
        myTableView.register(PostTableCell.self, forCellReuseIdentifier: "PostCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //myTableView.rowHeight = UITableView.automaticDimension
        //myTableView.estimatedRowHeight = 100
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableCell
        //cell.textLabel?.text = self.data[indexPath.row]
      //  cell.postText.text = String(indexPath.row)
       // cell.backgroundColor = UIColor.red
       // cell.layer.borderColor = UIColor.black.cgColor
        cell.setVar()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
       //return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let viewController = PostViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
