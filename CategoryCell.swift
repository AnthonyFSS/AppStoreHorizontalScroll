//
//  CategoryCell.swift
//  AppStore
//
//  Created by Foo Shyang Song on 17/06/2016.
//  Copyright © 2016 TheLorry. All rights reserved.
//
import UIKit


class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private let cellId = "appCellId"
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let nameLabel: UILabel = {
        let label   = UILabel()
        label.text = "Pick A Android"
        label.font = UIFont.systemFontOfSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // change the layout direction to Horizontal
        layout.scrollDirection = .Horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clearColor()
        return collectionView
    
    
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
         view.translatesAutoresizingMaskIntoConstraints = false
        return view
    
    }()
    
    func setupviews(){
        backgroundColor = UIColor.clearColor()
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate  = self
        
        appsCollectionView.registerClass(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : dividerLineView]))
        
        
        
        //add constraint
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appsCollectionView,"v1":dividerLineView,"nameLabel":nameLabel]))
        
    
    
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
    }
    //set the size width to 150 and the height is same with the frame
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(100, frame.height - 50 )
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}


class AppCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "android")
        iv.contentMode = .ScaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label   = UILabel()
        label.text = "SuperDroid"
        label.font = UIFont.systemFontOfSize(14)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label   = UILabel()
        label.text = "Fast Car"
        label.font = UIFont.systemFontOfSize(12)
        label.numberOfLines = 1
        return label
    }()
    
    let priceLabel: UILabel = {
        let label   = UILabel()
        label.text = "$3.40"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.darkGrayColor()
        return label
    }()
    
    
    
    func setupviews()
    {
    //backgroundColor = UIColor.blackColor()
    addSubview(imageView)
    addSubview(nameLabel)
    addSubview(categoryLabel)
    addSubview(priceLabel)

        
        
        
    imageView.frame     = CGRectMake(0, 0, frame.width,frame.width)
    nameLabel.frame     = CGRectMake(0, frame.width + 2, frame.width, 40)
    categoryLabel.frame = CGRectMake(0, frame.width + 38, frame.width, 20)
    priceLabel.frame    = CGRectMake(0, frame.width + 56, frame.width, 20)
    
    }
}
