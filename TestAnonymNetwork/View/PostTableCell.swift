//
//  PostTableCell.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 17.06.2021.
//

import UIKit

class PostTableCell: UITableViewCell {
    
    //MARK: - variables
    let authorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    let headingText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    let postImage: UIImageView = {
        let myImage = UIImageView()
        myImage.contentMode = .scaleAspectFit
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage
    }()
    
    let heartImage: UIImageView = {
        let myImage = UIImageView()
        myImage.image = UIImage(systemName: "suit.heart.fill")
        return myImage
    }()
    
    let likesCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - ui components
    private let stackViews: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0
        
        return stack
    }()
    
    private let headView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let dataView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    private let statisticsView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        
        return view
    }()

    private let stackHead: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private let stackStatistics: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 5
        
        return stack
    }()
    
    func setCell () {
       
        contentView.addSubview(stackViews)
        setStackViewConstraints()
      
        stackViews.addArrangedSubview(headView)
        stackViews.addArrangedSubview(dataView)
        stackViews.addArrangedSubview(statisticsView)
        
        headView.addSubview(stackHead)
        setStackHeadConstraints()
        
        stackHead.addArrangedSubview(authorName)
        stackHead.addArrangedSubview(headingText)
        
        dataView.addSubview(postImage)
        postImage.contentMode = .scaleAspectFit
        postImage.translatesAutoresizingMaskIntoConstraints = false
        setPostImageConstraints()
       
        stackStatistics.addArrangedSubview(heartImage)
        stackStatistics.addArrangedSubview(likesCount)
        
        statisticsView.addSubview(stackStatistics)
    }
    
    //MARK: - set constraints
    func setStackViewConstraints() {
        let constrains = [
            stackViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackViews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)]
        
        NSLayoutConstraint.activate(constrains)
    }
    
    func setStackHeadConstraints() {
        let constrains = [
            stackHead.leadingAnchor.constraint(equalTo: headView.leadingAnchor),
            stackHead.trailingAnchor.constraint(equalTo: headView.trailingAnchor),
            stackHead.bottomAnchor.constraint(equalTo: headView.bottomAnchor),
            stackHead.topAnchor.constraint(equalTo: headView.topAnchor)]
        NSLayoutConstraint.activate(constrains)
    }
    func setPostImageConstraints() {
        let constrains = [
            postImage.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            postImage.bottomAnchor.constraint(equalTo: dataView.bottomAnchor),
            postImage.topAnchor.constraint(equalTo: dataView.topAnchor)]
        NSLayoutConstraint.activate(constrains)
    }
    
    func setVar() {
        authorName.text = "Автор"
        headingText.text = "Название"
        postImage.image = UIImage(named: "postfoto")
        likesCount.text = "10"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        //postText.frame = CGRect(x: 5, y: 20, width: 100, height: contentView.frame.height-5)
    }
}

class CustomView: UIView {
    var height = 1.0
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 1.0, height: height)
    }
}
