//
//  ViewController.swift
//  YoutubeMenuBar
//
//  Created by Manikanta Varma on 5/20/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {

    lazy var menuBar: MenuBar = {
        let menu = MenuBar()
        menu.collectionViewObject = self
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.title = youtubeMenuBarTitles.first!
        registerCellClassesAndCustomization()
        setupMenuBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func registerCellClassesAndCustomization() {
        if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        self.collectionView!.register(HomePageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCellName)
        
    }
    
    func scrollToMenuIndex(indexToSelect:Int) {
        let indePath = NSIndexPath(item: indexToSelect, section: 0)
        collectionView?.scrollToItem(at: indePath as IndexPath, at: UICollectionViewScrollPosition(), animated: true)
        navigationItem.title = youtubeMenuBarTitles[indexToSelect]
    }
    
    private func setupMenuBar() {
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(menuBar)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":menuBar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":menuBar]))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return youtubeMenuBarTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCellName, for: indexPath) as? HomePageCollectionViewCell else { return UICollectionViewCell() }
        cell.titleLabel.text = youtubeMenuBarTitles[indexPath.row]
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalConstraint?.constant = scrollView.contentOffset.x / CGFloat(youtubeMenuBarTitles.count)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPathToBeSelected = NSIndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPathToBeSelected as IndexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())
        navigationItem.title = youtubeMenuBarTitles[index]
    }

}

