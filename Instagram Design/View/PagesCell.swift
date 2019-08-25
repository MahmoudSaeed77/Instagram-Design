//
//  PagesCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/23/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class PagesCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let profileCellId = "profileCellId"
    let activityId = "activityId"
    
    
    let collectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.lightGray
        layout.scrollDirection = .vertical
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        addSubview(collectioView)
        
        collectioView.delegate = self
        collectioView.dataSource = self
        
        collectioView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        collectioView.register(ProfileCell.self, forCellWithReuseIdentifier: profileCellId)
        collectioView.register(ActivityCell.self, forCellWithReuseIdentifier: activityId)
        
        
        NSLayoutConstraint.activate([
            collectioView.widthAnchor.constraint(equalTo: widthAnchor),
            collectioView.heightAnchor.constraint(equalTo: heightAnchor),
            ])
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 4 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: profileCellId, for: indexPath) as! ProfileCell
        }else if indexPath.item == 3 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: activityId, for: indexPath) as! ActivityCell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 450)
    }
    
    
    @objc func shareAction(sender: UIButton){

        print("12345678")
        let vc = HomeVC()
        vc.constraintsWork(shareClicked: false)
//        if vc.shareClicked {
//            NSLayoutConstraint.activate(vc.topConstraint)
//            NSLayoutConstraint.deactivate(vc.bottomConstraints)
//            vc.shareClicked = !vc.shareClicked
//        }else{
//            NSLayoutConstraint.activate(vc.bottomConstraints)
//            NSLayoutConstraint.deactivate(vc.topConstraint)
//            vc.shareClicked = !vc.shareClicked
//        }

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

