//
//  ViewController.swift
//  newProject2
//
//  Created by Alex Lee on 22/03/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 10
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var switchStateLabel: UILabel!
    @IBOutlet weak var segmentLabel: UILabel!
    
    
    @IBOutlet weak var switching: UISwitch!
    
    
    
    @IBOutlet weak var segementValue: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print ("ViewController")
        
        numberLabel.text = String(number)
        
        segementValue.selectedSegmentIndex = 0
        
        
        switchStateLabel.text = "ON"
        
        segmentLabel.text = "First"
        
        
        
    }
    
    
    @IBAction func subtractionButton(_ sender: UIButton) {
        number -= 1
        numberLabel.text = String(number)
        numberLabel.textColor = .red
        
    }
    
    
    @IBAction func additionButton(_ sender: UIButton) {
        number += 1
        numberLabel.text = String(number)
        numberLabel.textColor = .blue
    }
    
    @IBAction func switchButton(_ sender: Any) {
        if switching.isOn {
            switchStateLabel.text = "ON"
        } else if !switching.isOn {
            switchStateLabel.text = "OFF"
        }
    }
    
    
    
    
    
    @IBAction func segValueChanged(_ sender: Any) {
        
        
        
        switch segementValue.selectedSegmentIndex {
        case 0 :
            segmentLabel.text = "First"
        case 1 :
            segmentLabel.text = "Second"
        case 2 :
            segmentLabel.text = "Third"
        case 3 :
            segmentLabel.text = "Fourth"
        default :
            break
        }
        
        
    }
    
}

