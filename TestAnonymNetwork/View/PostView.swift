//
//  PostView.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 22.06.2021.
//

import UIKit

class PostView: UIView {
    
    //MARK: - UI components
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let stackMain: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.spacing = 0
        stack.alignment = .fill
        
        return stack
    }()
    
    private let headView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        view.contentMode = .scaleToFill
 
        return view
    }()
    
    private let dataView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    private let staticticsView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let stackHead: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.alignment = .fill
        
        return stack
    }()
    
    //MARK: - Data components
    private let authorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    private let headingText: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private let postImage: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.contentMode = .scaleAspectFit
        
        return myImage
    }()
    
    func setView() {
        mainView.addSubview(stackMain)
        setStackViewConstraints()
        
        stackMain.addArrangedSubview(headView)
        stackMain.addArrangedSubview(dataView)
        
        headView.addSubview(stackHead)
        setStackHeadConstraints()
        
        stackHead.addArrangedSubview(authorName)
        stackHead.addArrangedSubview(headingText)
        
        dataView.addSubview(postImage)
        setPostImageConstraints()
        setVariables()
    }
    
    func setStackViewConstraints() {
        let constraints = [
            stackMain.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            stackMain.topAnchor.constraint(equalTo: mainView.topAnchor),
            stackMain.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            stackMain.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setStackHeadConstraints() {
        let constraints = [
            stackHead.leadingAnchor.constraint(equalTo: headView.leadingAnchor),
            stackHead.topAnchor.constraint(equalTo: headView.topAnchor),
            stackHead.trailingAnchor.constraint(equalTo: headView.trailingAnchor),
            stackHead.bottomAnchor.constraint(equalTo: headView.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setPostImageConstraints() {
        let constraints = [
            postImage.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            postImage.topAnchor.constraint(equalTo: dataView.topAnchor),
            postImage.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            postImage.bottomAnchor.constraint(equalTo: dataView.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setVariables() {
        authorName.text = "newAuthor"
        headingText.text = "head text"
        postImage.image = UIImage(named: "cat")
    }
}
