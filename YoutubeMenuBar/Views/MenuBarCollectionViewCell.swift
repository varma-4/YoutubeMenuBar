//
//  MenuBarCollectionViewCell.swift
//  YoutubeMenuBar
//
//  Created by Manikanta Varma on 5/20/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//


import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white :UIColor.black
        }
    }
    
    let imageView:UIImageView = {
        let imageViewOfButton = UIImageView()
        imageViewOfButton.image = UIImage(named:"testicon1")?.withRenderingMode(.alwaysOriginal)
        imageViewOfButton.translatesAutoresizingMaskIntoConstraints = false
        imageViewOfButton.tintColor = UIColor.black
        return imageViewOfButton
    }()
    
    private func setupButtons() {
        backgroundColor = UIColor(red: 69/255, green: 81/255, blue: 99/255, alpha: 1)
        addSubview(imageView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(25)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }

}
