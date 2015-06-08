//
//  CardsViewController.swift
//  MakeDate
//
//  Created by Vishal Patel on 05/06/15.
//  Copyright (c) 2015 BitterMelonTech. All rights reserved.
//

import UIKit
import Parse

class CardsViewController: UIViewController, SwipeViewDelegate {

    @IBOutlet weak var cardStackView: UIView!
    
    struct Card {
        let cardView : CardView
        let swipeView : SwipeView
    }
    
    let frontCardTopMargin : CGFloat = 0.0
    let backCardTopMargin : CGFloat = 10.0
    
    var frontCard : Card?
    var backCard : Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        //MARK:- Testing Parse
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            println("Object has been saved.")
//        }
        
        cardStackView.backgroundColor = UIColor.clearColor()
        
        backCard = createCard(backCardTopMargin)
        cardStackView.addSubview(backCard!.swipeView)
        
        frontCard = createCard(frontCardTopMargin)
        cardStackView.addSubview(frontCard!.swipeView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRect(x: 0.0, y: topMargin, width: cardStackView.frame.width, height: cardStackView.frame.height)
    }
    
    private func createCard(topMargin: CGFloat) -> Card {
        let cardView = CardView()
        let swipeView = SwipeView(frame: createCardFrame(topMargin))
        swipeView.delegate = self
        swipeView.innerView = cardView
        return Card(cardView: cardView, swipeView: swipeView)
        
    }
    
    // MARK: SwipeViewDelegate
    
    func swipedLeft() {
        println("Left")
        if let frontCard = frontCard {
            frontCard.swipeView.removeFromSuperview()
        }
    }
    func swipedRight() {
        println("Right")
        if let frontCard = frontCard {
            frontCard.swipeView.removeFromSuperview()
        }
        
    }
    
    

}
