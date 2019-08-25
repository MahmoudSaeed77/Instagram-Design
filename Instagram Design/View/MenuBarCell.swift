//
//  MenuBarCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/22/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class MenuBarCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Home")?.withRenderingMode(.alwaysTemplate))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override var isHighlighted: Bool {
        didSet{
            if isHighlighted {
                imageView.tintColor = .white
            }else{
                imageView.tintColor = .black
            }
        }
    }
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                imageView.tintColor = .white
            }else{
                imageView.tintColor = .black
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
