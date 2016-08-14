//
//  ViewController.swift
//  youtube101
//
//  Created by PARK JAICHANG on 8/14/16.
//  Copyright © 2016 JAICHANGPARK. All rights reserved.
//

import UIKit

class HomeContorller: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1 . view.backgroundColor = UIColor.redColor()
      navigationItem.title = "Home"
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellId")
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
   
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        
       // cell.backgroundColor = UIColor.redColor()
        
        return cell
    }
    // UICollectionViewDelegateFlowLayout 상속
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       //넓이는 뷰의 프레임, 높이는 200의 값을 리턴
        return CGSizeMake(view.frame.width, 200)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
}

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    let thumnailImageView : UIImageView = {
       
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blueColor()
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.greenColor()
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let seperatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLable: UILabel = {
       
        let label = UILabel()
        label.backgroundColor = UIColor.purpleColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView : UITextView = {
        
        let textView = UITextView()
        textView.backgroundColor = UIColor.redColor()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
    }()
    
    func setupViews(){
        
       // 1. backgroundColor = UIColor.blueColor()
       // 2 
        
        addSubview(thumnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLable)
        addSubview(subtitleTextView)

        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumnailImageView)
        
        addConstraintsWithFormat("H:|-16-[v0(44)]|", views: userProfileImageView)
        
        //수직 constraints
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumnailImageView,userProfileImageView,seperatorView)
        addConstraintsWithFormat("H:|[v0]|", views: seperatorView)
        
        //top constraints
        
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Top, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        
        //left
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        
        //right 
        
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Right, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        //height
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
        //top
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLable, attribute: .Bottom, multiplier: 1, constant: 8))
        
        //left
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        
        //right
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        //height
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
        //addConstraintsWithFormat("H:|[v0]|", views: titleLable)
        //addConstraintsWithFormat("V:|[v0(20)]|", views: titleLable)
        
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView{
    
    func addConstraintsWithFormat(format : String, views :UIView...){
        
        var viewsDictionary = [String : UIView]()
        
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
        
    }
    
    
}

