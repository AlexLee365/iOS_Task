//
//  SecondViewController.swift
//  SegementAndSegueTask
//
//  Created by Alex Lee on 03/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataSegmentControl: UISegmentedControl!
    
    
    
    var segementValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segementChanged(_ sender: UISegmentedControl) {
        
        
        segementValue = dataSegmentControl.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
        
//        switch sender.selectedSegmentIndex {
//        case 0 :
//            segementValue = "First"
//        case 1:
//            segementValue = "Second"
//        case 2:
//            segementValue = "Third"
//        default :
//            break
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
