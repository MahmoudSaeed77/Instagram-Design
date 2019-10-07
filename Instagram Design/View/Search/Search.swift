//
//  Search.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 10/4/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class Search: UICollectionViewCell {
    let listId = "listId"
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.alwaysBounceVertical = true
        layout.scrollDirection = .vertical
        collection.backgroundColor = UIColor.lightGray
        return collection
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: listId)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(searchBar)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            searchBar.widthAnchor.constraint(equalTo: widthAnchor),
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            
            collectionView.widthAnchor.constraint(equalTo: widthAnchor),
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Search: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listId, for: indexPath) as! ListCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

class ListCell: UICollectionViewCell {
    let hashLabel: UILabel = {
        let label = UILabel()
        label.text = "#"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hashName: UILabel = {
        let label = UILabel()
        label.text = "#lamborgini"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let postCount: UILabel = {
        let label = UILabel()
        label.text = "356.564 posts"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        addSubview(hashLabel)
        addSubview(hashName)
        addSubview(postCount)
        
        NSLayoutConstraint.activate([
            hashLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hashLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            hashName.leadingAnchor.constraint(equalTo: hashLabel.trailingAnchor, constant: 10),
            hashName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            postCount.leadingAnchor.constraint(equalTo: hashName.leadingAnchor),
            postCount.topAnchor.constraint(equalTo: hashName.bottomAnchor, constant: 2)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
