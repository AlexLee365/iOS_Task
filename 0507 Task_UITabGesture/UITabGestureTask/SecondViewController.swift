//
//  SecondViewController.swift
//  UITabGestureTask
//
//  Created by Alex Lee on 09/05/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var coordinateLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var priorLocation = CGPoint.zero
    
    var count = 0 {
        didSet{
            countLabel.text = String(count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "HandleTapGesture"
    }
    
    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        
        let x = String(format: "%.1f", location.x)
        let y = String(format: "%.1f", location.y)
        
        coordinateLabel.text = "(\(x), \(y))"
        
        ( abs(location.x - priorLocation.x) <= 10 || abs(location.y - priorLocation.y) <= 10 ) ? (count += 1) : (count = 1)
        
        priorLocation = location
        
    }
    
}
