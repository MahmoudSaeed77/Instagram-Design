//
//  HomeVC.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/20/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    let profileCellId = "profileCellId"
    let activityId = "activityId"
    let homeId = "homeId"
    let searchId = "searchId"
    let cameraId = "cameraId"
    
    var topConstraint = [NSLayoutConstraint]()
    var bottomConstraints = [NSLayoutConstraint]()
    
    var shareClicked: Bool = true
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9646012187, green: 0.9647662044, blue: 0.9645908475, alpha: 1)
        return view
    }()
    
    let instaLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Bitmap")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let newMessageIcon: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        collection.backgroundColor = #colorLiteral(red: 0.9646012187, green: 0.9647662044, blue: 0.9645908475, alpha: 1)
        collection.isPagingEnabled = true
        layout.minimumLineSpacing = 0
        return collection
    }()
    
    lazy var menuBar: MenuBar = {
        let bar = MenuBar()
        bar.homeController = self
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let shareView = UIView()
    
    let overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        view.layer.opacity = 0.7
        return view
    }()
    
    
    let search: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let shareTitle: UILabel = {
        let label = UILabel()
        label.text = "Share"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let shareCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        collection.backgroundColor = .red
        return collection
    }()
    
    let secondSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let socialCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        collection.backgroundColor = .red
        return collection
    }()
    
    let thirdSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.clipsToBounds = true
        cancelButton.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        shareView.translatesAutoresizingMaskIntoConstraints = false
        shareView.backgroundColor = UIColor.white
        shareView.layer.shadowColor = UIColor.black.cgColor
        shareView.layer.shadowOpacity = 0.5
        shareView.layer.shadowOffset = .zero
        
        
        collectionView.collectionViewLayout.invalidateLayout()
        
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: profileCellId)
        collectionView.register(ActivityCell.self, forCellWithReuseIdentifier: activityId)
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: homeId)
        collectionView.register(Search.self, forCellWithReuseIdentifier: searchId)
        collectionView.register(Camera.self, forCellWithReuseIdentifier: cameraId)
        
        
        
        
        view.addSubview(topView)
        topView.addSubview(instaLogo)
        topView.addSubview(newMessageIcon)
        view.addSubview(collectionView)
        view.addSubview(menuBar)
        view.addSubview(overlayView)
        overlayView.addGestureRecognizer(tap)
        view.addSubview(shareView)
        
        
        overlayView.isHidden = true
        
        topConstraint = [
            shareView.widthAnchor.constraint(equalTo: view.widthAnchor),
            shareView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shareView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ]
        bottomConstraints = [
            shareView.widthAnchor.constraint(equalTo: view.widthAnchor),
            shareView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shareView.heightAnchor.constraint(equalToConstant: 0)
        ]
        NSLayoutConstraint.activate(bottomConstraints)
        
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalToConstant: 110),
            
            instaLogo.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            instaLogo.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            newMessageIcon.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
            newMessageIcon.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            menuBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 75),
            
            overlayView.widthAnchor.constraint(equalTo: view.widthAnchor),
            overlayView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
            ])
        
           shareView.addSubview(search)
           shareView.addSubview(shareTitle)
           shareView.addSubview(seperatorView)
           shareView.addSubview(shareCollection)
           shareView.addSubview(secondSeperatorView)
           shareView.addSubview(socialCollection)
           shareView.addSubview(thirdSeperatorView)
           shareView.addSubview(cancelButton)

        
        
        NSLayoutConstraint.activate([
            search.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: 15),
            search.topAnchor.constraint(equalTo: shareView.topAnchor, constant: 10),
            
            shareTitle.centerXAnchor.constraint(equalTo: shareView.centerXAnchor),
            shareTitle.topAnchor.constraint(equalTo: shareView.topAnchor, constant: 10),
            
            seperatorView.widthAnchor.constraint(equalTo: shareView.widthAnchor),
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            seperatorView.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 10),
            
            shareCollection.widthAnchor.constraint(equalTo: view.widthAnchor),
            shareCollection.topAnchor.constraint(equalTo: seperatorView.bottomAnchor),
            shareCollection.heightAnchor.constraint(equalTo: shareView.heightAnchor, multiplier: 0.3),
            
            secondSeperatorView.widthAnchor.constraint(equalTo: shareView.widthAnchor),
            secondSeperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            secondSeperatorView.topAnchor.constraint(equalTo: shareCollection.bottomAnchor),
            
            socialCollection.widthAnchor.constraint(equalTo: view.widthAnchor),
            socialCollection.topAnchor.constraint(equalTo: secondSeperatorView.bottomAnchor),
            socialCollection.heightAnchor.constraint(equalTo: shareView.heightAnchor, multiplier: 0.3),
            
            thirdSeperatorView.widthAnchor.constraint(equalTo: shareView.widthAnchor),
            thirdSeperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            thirdSeperatorView.topAnchor.constraint(equalTo: socialCollection.bottomAnchor),
            
            
            cancelButton.bottomAnchor.constraint(equalTo: shareView.bottomAnchor, constant: -10),
            cancelButton.centerXAnchor.constraint(equalTo: shareView.centerXAnchor)
            ])
        
    }
    
    @objc func tapAction(sender: UITapGestureRecognizer){
        NSLayoutConstraint.deactivate(topConstraint)
        NSLayoutConstraint.activate(bottomConstraints)
        overlayView.isHidden = true
        cancelButton.isHidden = true
    }
    
    
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 4 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: profileCellId, for: indexPath) as! ProfileCell
        }else if indexPath.item == 3 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: activityId, for: indexPath) as! ActivityCell
        }else if indexPath.item == 1 {
            
            return collectionView.dequeueReusableCell(withReuseIdentifier: searchId, for: indexPath) as! Search
        }else if indexPath.item == 2 {
            
            return collectionView.dequeueReusableCell(withReuseIdentifier: cameraId, for: indexPath) as! Camera
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeId, for: indexPath) as! HomeCell
        
        cell.homevc = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 120)
    }
    
    
}

