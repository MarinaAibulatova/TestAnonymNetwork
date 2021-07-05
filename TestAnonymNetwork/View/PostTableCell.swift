//
//  PostTableCell.swift
//  TestAnonymNetwork
//
//  Created by Марина Айбулатова on 17.06.2021.
//

import UIKit
import AVFoundation

class PostTableCell: UITableViewCell {
    
    var player: AVAudioPlayer!
    
    //MARK: - variables
    var authorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    var headingText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let postImage: UIImageView = {
        let myImage = UIImageView()
        myImage.contentMode = .scaleAspectFit
        myImage.translatesAutoresizingMaskIntoConstraints = false
        
        return myImage
    }()
    
    let likesImage: UIImageView = {
        let myImage = UIImageView()
        myImage.image = UIImage(systemName: "heart")
        myImage.contentMode = .scaleAspectFit
        return myImage
    }()
    
    let likesCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    let viewsImage: UIImageView = {
        let myImage = UIImageView()
        myImage.image = UIImage(systemName: "eye")
        myImage.contentMode = .scaleAspectFit
        return myImage
    }()
    
    let viewsCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    let commentsImage: UIImageView = {
        let myImage = UIImageView()
        myImage.image = UIImage(systemName: "text.bubble")
        myImage.contentMode = .scaleAspectFit
        return myImage
    }()
    
    let commentsCount: UILabel = {
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
    
    private let stackLikes: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.alignment = .center
        
        return stack
    }()
    
    private let stackPostViews: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 0
        
        return stack
    }()
    
    private let stackComments: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 0
        
        return stack
    }()
    
    private let buttonSound: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test", for: UIControl.State.normal)
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        button.backgroundColor = UIColor.red
        return button
    }()
    
    @objc func buttonAction(_ sender: UIButton!) {
        print("Test")
    }
    
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
        setPostImageConstraints()
       
        buttonSound.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        
        //dataView.addSubview(buttonSound)
        
        stackStatistics.addArrangedSubview(stackLikes)
        stackStatistics.addArrangedSubview(stackPostViews)
        stackStatistics.addArrangedSubview(stackComments)
        
        stackLikes.addArrangedSubview(likesImage)
        stackLikes.addArrangedSubview(likesCount)
        
        stackPostViews.addArrangedSubview(viewsImage)
        stackPostViews.addArrangedSubview(viewsCount)
        
        stackComments.addArrangedSubview(commentsImage)
        stackComments.addArrangedSubview(commentsCount)
        
        statisticsView.addSubview(stackStatistics)
        setStackStatisticsConstraints()
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
    
    func setStackStatisticsConstraints() {
        let constraints = [
            stackStatistics.leadingAnchor.constraint(equalTo: statisticsView.leadingAnchor),
            stackStatistics.trailingAnchor.constraint(equalTo: statisticsView.trailingAnchor),
            stackStatistics.topAnchor.constraint(equalTo: statisticsView.topAnchor),
            stackStatistics.bottomAnchor.constraint(equalTo: statisticsView.bottomAnchor)]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setVar(post: Post) {
        let author = post.authorName ?? "no author"
        authorName.text = "author: \(author)"
        headingText.text = post.headerText
        
        for content in post.content {
            switch content.key {
            case .IMAGE:
                
                if let url = URL(string: content.value) {
                    let data = try? Data(contentsOf: url)
                    postImage.image = UIImage(data: data!)
                }
                
            case .IMAGE_GIF:
                
                postImage.animationImages = UIImageView.fromGif(urlString: content.value)
                postImage.startAnimating()
                
            case .AUDIO:
                //m4a does not work
                if let url = URL(string: content.value) {
                    do {
                        
                        let soundToPlay = Bundle.main.path(forResource: "startRound", ofType: "mp3")
                        
                        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundToPlay!))
                        
                        player.prepareToPlay()
                        player.volume = 1.0
                       
                        player.play()
                 
                    }catch {
                        print(error)
                    }
                }
                
            default:
                print("")
            }
        }
        
        likesCount.text = String(post.postStatistic[PostStatiscticType.likes]!)
        viewsCount.text = String(post.postStatistic[PostStatiscticType.views]!)
        commentsCount.text = String(post.postStatistic[PostStatiscticType.comments]!)
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

extension UIImageView {
    
    static func fromGif(urlString: String) -> [UIImage]? {
        let url = URL(string: urlString)
        guard let gifData = try? Data(contentsOf: url!), let source = CGImageSourceCreateWithData(gifData as CFData, nil) else {
            return nil
        }
        
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        
        return images
        
    }
}
