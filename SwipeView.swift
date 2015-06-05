//
//  SwipeView.swift
//  MakeDate
//
//  Created by Vishal Patel on 05/06/15.
//  Copyright (c) 2015 BitterMelonTech. All rights reserved.
//

import Foundation
import UIKit

protocol SwipeViewDelegate : class {
    func swipedRight()
    func swipedLeft()
}

class SwipeView: UIView {
    
    
    var innerView : UIView? {
        didSet {
            if let view = innerView {
                self.addSubview(view)
                view.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: self.frame.height)
                
            }
        }
    }
    private var originalPoint : CGPoint?

    //Delegate
    
    weak var delegate: SwipeViewDelegate?
    
    
    
    enum Direction {
        case None
        case Left
        case Right
    }
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
        
        //Adding gestureRecognizer
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragged:"))
    
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
            
            if (abs(distance.x) < self.frame.width/4){
                resetSwpieViewPositionAndTransformation()
            }
            else {
                self.swipeDirection(distance.x > 0 ? .Right : .Left)
            }
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
    
    func swipeDirection (direction: Direction) {
        
        if direction == .None {
            return
        }
        
        var parentWidth = superview!.frame.size.width
        
        if direction == .Left {
            parentWidth *= -1
        }
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.center.x = self.frame.origin.x + parentWidth
            }, completion: {
                success in
                if let delegate = self.delegate {
                    direction == .Right ? delegate.swipedRight() : delegate.swipedLeft()

                }
        })
        
    }
    
}