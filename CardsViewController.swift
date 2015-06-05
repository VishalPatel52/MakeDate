//
//  CardsViewController.swift
//  MakeDate
//
//  Created by Vishal Patel on 05/06/15.
//  Copyright (c) 2015 BitterMelonTech. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardStackView: UIView!
    
    let frontCardTopMargin : CGFloat = 0.0
    let backCardTopMargin : CGFloat = 10.0
    
    var frontCard : SwipeView?
    var backCard : SwipeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cardStackView.backgroundColor = UIColor.clearColor()
        
        frontCard = SwipeView(frame: createCardFrame(frontCardTopMargin))
        cardStackView.addSubview(frontCard!)
        
        backCard = SwipeView(frame: createCardFrame(backCardTopMargin))
        cardStackView.addSubview(backCard!)     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRect(x: 0.0, y: topMargin, width: cardStackView.frame.width, height: cardStackView.frame.height)
    }

}
