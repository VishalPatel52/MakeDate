//
//  SwipeView.swift
//  MakeDate
//
//  Created by Vishal Patel on 05/06/15.
//  Copyright (c) 2015 BitterMelonTech. All rights reserved.
//

import Foundation
import UIKit

class SwipeView: UIView {
    
    private var originalPoint : CGPoint?
    
    private let card: CardView = CardView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    init(){
        super.init(frame: CGRectZero)
        initialize()
        
    }
    
    private func initialize(){
    
        self.backgroundColor = UIColor.clearColor()
        self.addSubview(card)
//        self.card.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        //Adding gestureRecognizer
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragged:"))
        
        card.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        
        
        
//        setConstraints()
        
    
    }
    
    func dragged(gestureRecognizer: UIPanGestureRecognizer) {
        let distance = gestureRecognizer.translationInView(self)
        println("distance: x = \(distance.x) , y = \(distance.y)")
        
        switch gestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            originalPoint = self.center
        case UIGestureRecognizerState.Changed:
            let rotationPercentage = min(distance.x/(self.superview!.frame.width/2), 1)
            let rotationAngle = (CGFloat(2*M_PI/16) * rotationPercentage)
            
            self.transform = CGAffineTransformMakeRotation(rotationAngle)
            
            self.center = CGPointMake(originalPoint!.x + distance.x, originalPoint!.y + distance.y)
        case UIGestureRecognizerState.Ended:
            resetSwpieViewPositionAndTransformation()
        default:
            println("Default for panGestureRecognizerState")
            break           

        }
        
        
    }
    
    private func resetSwpieViewPositionAndTransformation(){
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.center = self.originalPoint!
            self.transform = CGAffineTransformMakeRotation(0)
        })
    }
    
//    private func setConstraints() {
//    
//        self.addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0))
//        self.addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
//        self.addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
//        self.addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
//        
//        
//    }
    
    
}