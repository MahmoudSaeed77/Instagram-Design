//
//  ActivityCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/23/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var clicked: Bool = false
    let cellId = "cellId"
    let secondId = "secondId"
    var leadingConstraints: [NSLayoutConstraint]!
    var trailingConstraints: [NSLayoutConstraint]!
    let triggerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12.5
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let activityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.black
        button.setTitle("Following", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 12.5
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.lightGray
        collection.alwaysBounceVertical = true
        layout.scrollDirection = .vertical
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(triggerView)
        triggerView.addSubview(activityButton)
        addSubview(collectionView)
        
        activityButton.addTarget(self, action: #selector(activityAction), for: .touchUpInside)
        collectionView.register(FollowingCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Second")

        
        NSLayoutConstraint.activate([
            triggerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            triggerView.topAnchor.constraint(equalTo: topAnchor),
            triggerView.heightAnchor.constraint(equalToConstant: 30),
            triggerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            collectionView.widthAnchor.constraint(equalTo: widthAnchor),
            collectionView.topAnchor.constraint(equalTo: triggerView.bottomAnchor, constant: 5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        leadingConstraints = [
            activityButton.heightAnchor.constraint(equalTo: triggerView.heightAnchor),
            activityButton.centerYAnchor.constraint(equalTo: triggerView.centerYAnchor),
            activityButton.leadingAnchor.constraint(equalTo: triggerView.leadingAnchor),
            activityButton.widthAnchor.constraint(equalTo: triggerView.widthAnchor, multiplier: 0.5)
        ]
        
        trailingConstraints = [
            activityButton.heightAnchor.constraint(equalTo: triggerView.heightAnchor),
            activityButton.centerYAnchor.constraint(equalTo: triggerView.centerYAnchor),
            activityButton.trailingAnchor.constraint(equalTo: triggerView.trailingAnchor),
            activityButton.widthAnchor.constraint(equalTo: triggerView.widthAnchor, multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(leadingConstraints)
        
    }
    
    @objc func activityAction(sender: UIButton){
        if clicked {
            NSLayoutConstraint.activate(leadingConstraints)
            NSLayoutConstraint.deactivate(trailingConstraints)
            activityButton.setTitle("Following", for: .normal)
            clicked = !clicked
        }else{
            NSLayoutConstraint.activate(trailingConstraints)
            NSLayoutConstraint.deactivate(leadingConstraints)
            activityButton.setTitle("You", for: .normal)
            clicked = !clicked
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FollowingCell
            
            return cell

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 150)
    }
}

