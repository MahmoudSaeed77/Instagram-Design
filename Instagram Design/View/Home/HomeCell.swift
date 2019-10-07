//
//  HomeCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/20/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    let cellId = "cellId"
    var homevc = HomeVC()
    let names = ["avatar", "Avatar-1"]
    let maps = ["Img", "Bitmap-1"]
    let collectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.lightGray
        layout.scrollDirection = .vertical
        collection.backgroundColor = #colorLiteral(red: 0.9646012187, green: 0.9647662044, blue: 0.9645908475, alpha: 1)
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = .white
        
        addSubview(collectioView)
        
        collectioView.delegate = self
        collectioView.dataSource = self
        
        collectioView.register(PostsCell.self, forCellWithReuseIdentifier: cellId)
        
        
        NSLayoutConstraint.activate([
            collectioView.widthAnchor.constraint(equalTo: widthAnchor),
            collectioView.heightAnchor.constraint(equalTo: heightAnchor),
            ])
        

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PostsCell
        cell.shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        cell.profileImage.image = UIImage(named: names[indexPath.item])
        cell.postImage.image = UIImage(named: maps[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 450)
    }

    
    @objc func shareAction(sender: UIButton){
        homevc.shareViewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
