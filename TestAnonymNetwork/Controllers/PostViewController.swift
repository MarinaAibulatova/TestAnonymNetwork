//
//  PostViewController.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 21.06.2021.
//

import UIKit

class PostViewController: UIViewController {

    //let post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postView = PostView()
        postView.setView()
        self.view.addSubview(postView.mainView)
        self.view.backgroundColor = UIColor.white
        
        setPostViewConstraints(viewForConstraint: postView)
        // Do any additional setup after loading the view.
    }
    
    
    func setPostViewConstraints(viewForConstraint: PostView) {
        let margins = view.layoutMarginsGuide
        let constraints = [
            viewForConstraint.mainView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            viewForConstraint.mainView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            viewForConstraint.mainView.topAnchor.constraint(equalToSystemSpacingBelow: self.view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: viewForConstraint.mainView.bottomAnchor, multiplier: 1.0)]
        
        NSLayoutConstraint.activate(constraints)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
