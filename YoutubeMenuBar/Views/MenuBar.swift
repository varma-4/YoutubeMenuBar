//
//  MenuBar.swift
//  YoutubeMenuBar
//
//  Created by Manikanta Varma on 5/20/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate {

    private let cellId = "menuBarCellID"
    var horizontalConstraint:NSLayoutConstraint?
    var collectionViewObject: ViewController?
    
    lazy var collectionView:UICollectionView = {
        let collectionOfButtons = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionOfButtons.translatesAutoresizingMaskIntoConstraints = false
        collectionOfButtons.delegate = self
        collectionOfButtons.dataSource = self
        return collectionOfButtons
    }()
    
    let horizontalBarForButton:UIView = {
        let hView = UIView()
        hView.backgroundColor = .white
        hView.translatesAutoresizingMaskIntoConstraints = false
        return hView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        collectionView.register(MenuBarCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addSubview(horizontalBarForButton)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
        
        let indexpath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: indexpath as IndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
        
        collectionView.isScrollEnabled = false
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection =  .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
        
        horizontalConstraint = horizontalBarForButton.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalConstraint?.isActive = true
        horizontalBarForButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarForButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarForButton.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- CollectionView DataSource AND Delegate Methods
extension MenuBar: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return youtubeMenuBarTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(frame.width / CGFloat(youtubeMenuBarTitles.count))
        return CGSize(width: width.roundValueOfSize(), height: frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCollectionViewCell
        cell.imageView.image = UIImage(named: "MenuBar\(indexPath.row + 1)")?.withRenderingMode(.alwaysOriginal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionViewObject?.scrollToMenuIndex(indexToSelect: indexPath.item)
    }
}
