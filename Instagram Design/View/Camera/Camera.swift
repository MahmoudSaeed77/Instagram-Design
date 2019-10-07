//
//  Camera.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 10/4/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class Camera: UICollectionViewCell {
    
    let cameraButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = UIColor.lightGray
        
        addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.widthAnchor.constraint(equalTo: widthAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
            ])
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
