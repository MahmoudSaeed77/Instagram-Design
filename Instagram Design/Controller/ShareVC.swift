//
//  ShareVC.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 10/7/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ShareVC: NSObject {
    
    
    let overlayView = UIView()
    let shareView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.red
        return collection
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
        collection.backgroundColor = .blue
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

    
    
    func showView(){
        
        
        overlayView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        if let window = UIApplication.shared.keyWindow {
            
            shareView.backgroundColor = UIColor.white
            
            window.addSubview(overlayView)
            window.addSubview(shareView)
            
            
            overlayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToDismiss)))
            
            
            overlayView.frame = window.frame
            
            let height: CGFloat = 300
            let y = window.frame.height - height
            shareView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            overlayView.alpha = 0
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.overlayView.alpha = 1
                self.shareView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: window.frame.height)
            }, completion: nil)
        }
    }
    
    @objc func tapToDismiss(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.overlayView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.shareView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            }
            
        }, completion: nil)
    }
    
    
    
    override init() {
        super.init()
        
        shareView.addSubview(search)
        shareView.addSubview(shareTitle)
        shareView.addSubview(seperatorView)
        shareView.addSubview(collectionView)
        shareView.addSubview(secondSeperatorView)
        shareView.addSubview(socialCollection)
        shareView.addSubview(thirdSeperatorView)
        shareView.addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            search.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: 10),
            search.topAnchor.constraint(equalTo: shareView.topAnchor, constant: 10),
            
            shareTitle.centerXAnchor.constraint(equalTo: shareView.centerXAnchor),
            shareTitle.topAnchor.constraint(equalTo: shareView.topAnchor, constant: 10),
            
            seperatorView.topAnchor.constraint(equalTo: shareTitle.bottomAnchor, constant: 10),
            seperatorView.widthAnchor.constraint(equalTo: shareView.widthAnchor),
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            collectionView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 5),
            collectionView.widthAnchor.constraint(equalTo: shareView.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: shareView.heightAnchor, multiplier: 30 / 300),
            
            secondSeperatorView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            secondSeperatorView.widthAnchor.constraint(lessThanOrEqualTo: shareView.widthAnchor),
            secondSeperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            socialCollection.topAnchor.constraint(equalTo: secondSeperatorView.bottomAnchor, constant: 5),
            socialCollection.widthAnchor.constraint(equalTo: shareView.widthAnchor),
            socialCollection.heightAnchor.constraint(equalTo: shareView.heightAnchor, multiplier: 30 / 300),
            
            thirdSeperatorView.topAnchor.constraint(equalTo: socialCollection.bottomAnchor, constant: 5),
            thirdSeperatorView.widthAnchor.constraint(lessThanOrEqualTo: shareView.widthAnchor),
            thirdSeperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            cancelButton.centerXAnchor.constraint(lessThanOrEqualTo: shareView.centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: thirdSeperatorView.bottomAnchor, constant: 5)
            ])
        
    }
}
