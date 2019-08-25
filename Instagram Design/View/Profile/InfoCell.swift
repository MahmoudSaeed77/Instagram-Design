//
//  InfoCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/22/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class InfoCell: UICollectionViewCell{
    
    let coverImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "image")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "More")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "follow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "avatar")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mahmoud Saeed"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "IOS Developer & a very genius man"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    let overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.brown
        view.layer.opacity = 0.3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        addSubview(coverImage)
        addSubview(overlayView)
        addSubview(moreButton)
        addSubview(followButton)
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            coverImage.widthAnchor.constraint(equalTo: widthAnchor),
            coverImage.heightAnchor.constraint(equalTo: heightAnchor),
            
            overlayView.widthAnchor.constraint(equalTo: widthAnchor),
            overlayView.heightAnchor.constraint(equalTo: heightAnchor),
            
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            moreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            moreButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            followButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            
            bioLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
            ])

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
