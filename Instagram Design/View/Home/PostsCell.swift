//
//  PostsCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/25/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class PostsCell: UICollectionViewCell {
    
    
    let profileImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "avatar")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "More")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mahmoud Saeed"
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sanafir, Qaluobia"
        label.textAlignment = .left
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let postImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Img")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Hope begins in the dark, the stubborn hope that if you just show up and try to do the right thing"
        text.textAlignment = .left
        text.textColor = UIColor.lightGray
        text.font = UIFont.systemFont(ofSize: 16)
        text.numberOfLines = 0
        return text
    }()
    
    let likeIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "btn_like_suggestion")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let commentIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "commentIcon")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "share")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let likeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "15 Likes"
        label.textAlignment = .left
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let commentCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 Comments"
        label.textAlignment = .left
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let timeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3 Days"
        label.textAlignment = .left
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(locationLabel)
        addSubview(moreButton)
        addSubview(postImage)
        addSubview(descriptionLabel)
        addSubview(likeIcon)
        addSubview(likeCountLabel)
        addSubview(commentIcon)
        addSubview(commentCountLabel)
        addSubview(shareButton)
        addSubview(timeCountLabel)
        
        
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            profileImage.heightAnchor.constraint(equalToConstant: 80),
            profileImage.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 10),
            
            locationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            moreButton.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            
            postImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 5),
            postImage.widthAnchor.constraint(equalTo: widthAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 220),
            
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 5),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            likeIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            likeIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            likeCountLabel.leadingAnchor.constraint(equalTo: likeIcon.trailingAnchor, constant: 5),
            likeCountLabel.centerYAnchor.constraint(equalTo: likeIcon.centerYAnchor),
            
            commentIcon.leadingAnchor.constraint(equalTo: likeCountLabel.trailingAnchor, constant: 20),
            commentIcon.centerYAnchor.constraint(equalTo: likeIcon.centerYAnchor),
            
            commentCountLabel.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 5),
            commentCountLabel.centerYAnchor.constraint(equalTo: commentIcon.centerYAnchor),
            
            shareButton.leadingAnchor.constraint(equalTo: commentCountLabel.trailingAnchor, constant: 20),
            shareButton.centerYAnchor.constraint(equalTo: commentIcon.centerYAnchor),
            shareButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            timeCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            timeCountLabel.centerYAnchor.constraint(equalTo: commentIcon.centerYAnchor)
            ])

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
