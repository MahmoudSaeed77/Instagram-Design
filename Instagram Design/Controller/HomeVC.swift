//
//  HomeVC.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/20/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    let cellId = "cellId"
//    let profileCellId = "profileCellId"
//    let activityId = "activityId"
//    let homeId = "homeId"
    
    let name = "Mahmoud Saeed"
    
    var topConstraint = [NSLayoutConstraint]()
    var bottomConstraints = [NSLayoutConstraint]()
//    var shareClicked: Bool = false
    let cell = HomeCell()
    
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
    let shareView: UIView = {
        let shareView = UIView()
        shareView.translatesAutoresizingMaskIntoConstraints = false
        shareView.backgroundColor = UIColor.yellow
        return shareView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.clipsToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        
        collectionView.collectionViewLayout.invalidateLayout()
        
        collectionView.register(PagesCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: profileCellId)
//        collectionView.register(ActivityCell.self, forCellWithReuseIdentifier: activityId)
//        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: homeId)
        
        
        
        
        view.addSubview(topView)
        topView.addSubview(instaLogo)
        topView.addSubview(newMessageIcon)
        view.addSubview(collectionView)
        view.addSubview(menuBar)
        view.addSubview(shareView)
        
        
        topConstraint = [
            shareView.widthAnchor.constraint(equalTo: view.widthAnchor),
            shareView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shareView.heightAnchor.constraint(equalToConstant: 500)
        ]
        bottomConstraints = [
            shareView.widthAnchor.constraint(equalTo: view.widthAnchor),
            shareView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shareView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(topConstraint)
        
        
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
            menuBar.heightAnchor.constraint(equalToConstant: 75)
            
            
            ])
        
        
    }
    
//    @objc func shareAction(sender: UIButton){
//
//        print("12345678")
//        if shareClicked {
//            NSLayoutConstraint.activate(topConstraint)
//            NSLayoutConstraint.deactivate(bottomConstraints)
//            shareClicked = !shareClicked
//        }else{
//            NSLayoutConstraint.activate(bottomConstraints)
//            NSLayoutConstraint.deactivate(topConstraint)
//            shareClicked = !shareClicked
//        }
//
//    }
    
    func constraintsWork(shareClicked: Bool){
        print("asdfghj")
        if shareClicked {
            NSLayoutConstraint.activate(topConstraint)
            NSLayoutConstraint.deactivate(bottomConstraints)
//            shareClicked = !shareClicked
        }else{
            NSLayoutConstraint.activate(bottomConstraints)
            NSLayoutConstraint.deactivate(topConstraint)
//            shareClicked = !shareClicked
        }
    }
    
    
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.item == 4 {
//            return collectionView.dequeueReusableCell(withReuseIdentifier: profileCellId, for: indexPath) as! ProfileCell
//        }else if indexPath.item == 3 {
//            return collectionView.dequeueReusableCell(withReuseIdentifier: activityId, for: indexPath) as! ActivityCell
//        }
//        let theCell = collectionView.dequeueReusableCell(withReuseIdentifier: homeId, for: indexPath) as! HomeCell
//        theCell.shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PagesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 120)
    }
    
    
}

