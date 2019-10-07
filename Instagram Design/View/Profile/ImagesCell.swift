//
//  ImagesCell.swift
//  Instagram Design
//
//  Created by Mohamed Ibrahem on 8/22/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ImagesCell: UICollectionViewCell{
    
    let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "")?.withRenderingMode(.alwaysTemplate))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

