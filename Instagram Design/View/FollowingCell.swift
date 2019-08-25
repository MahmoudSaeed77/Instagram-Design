//
//  FollowingCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/24/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class FollowingCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let profileImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "avatar")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mahnmoud Saeed"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Liked your photo"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let sharableFollowersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "doda, weza"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let photoLikedCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.cyan
        collection.alwaysBounceHorizontal = true
        layout.scrollDirection = .horizontal
        return collection
    }()
    
    let timeCounter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "15 min ago"
        label.numberOfLines = 0
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        photoLikedCollection.register(PhotoLiked.self, forCellWithReuseIdentifier: cellId)
        photoLikedCollection.delegate = self
        photoLikedCollection.dataSource = self
        
        backgroundColor = UIColor.white
        addSubview(timeCounter)
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(sharableFollowersLabel)
        addSubview(photoLikedCollection)
        
        NSLayoutConstraint.activate([
            timeCounter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            timeCounter.centerYAnchor.constraint(equalTo: centerYAnchor),
            timeCounter.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            
            profileImageView.leadingAnchor.constraint(equalTo: timeCounter.trailingAnchor, constant: 5),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            sharableFollowersLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            sharableFollowersLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            
            photoLikedCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
            photoLikedCollection.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoLikedCollection.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            photoLikedCollection.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotoLiked
        
        return cell
    }
    
}

class PhotoLiked: UICollectionViewCell {
    let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "avatar")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        addSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

