//
//  ViewController.swift
//  UITabGestureTask
//
//  Created by Alex Lee on 08/05/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var coordinateLabel: UILabel!
    
    var priorLocation: CGPoint = CGPoint(x: 0, y: 0)
    
    var count = 0 {
        didSet{
            countLabel.text = String(count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TouchesBegan"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        
        let location = touch.location(in: touch.view)
        let x = String(format: "%.1f", location.x)
        let y = String(format: "%.1f", location.y)
        
        coordinateLabel.text = "(\(x), \(y))"
        
        ( abs(location.x - priorLocation.x) <= 10 || abs(location.y - priorLocation.y) <= 10 ) ? (count += 1) : (count = 1)
        
        priorLocation = location
        
    }
    
    
    
    
    
    
    


}

