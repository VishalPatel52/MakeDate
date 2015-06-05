//
//  CardView.swift
//  MakeDate
//
//  Created by Vishal Patel on 05/06/15.
//  Copyright (c) 2015 BitterMelonTech. All rights reserved.
//

import Foundation
import UIKit

class CardView : UIView {
    
    private let imageView : UIImageView = UIImageView()
    private let nameLabel : UILabel = UILabel()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    init() {
        super.init(frame: CGRectZero)
        initialize()
    }
    
    private func initialize(){
        
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView.backgroundColor = UIColor.blackColor()
        self.addSubview(imageView)
        
        nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        nameLabel.backgroundColor = UIColor.whiteColor()
        self.addSubview(nameLabel)
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
        setConstraints()
        
    }
    
    private func setConstraints(){
        
        //Constraints for ImageView
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        
        //Constraints for nameLabel
        
        self.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: imageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        
        
    }
}