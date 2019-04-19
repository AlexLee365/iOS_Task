//
//  SecondViewController.swift
//  BogusAlertControllerTask
//
//  Created by Alex Lee on 10/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func yellowButtonClicked(_ sender: Any) {
        guard let firstVC = presentingViewController as? ViewController else {return}
        firstVC.view.backgroundColor = .yellow
        
    }
    
    @IBAction func whiteButtonClicked(_ sender: Any) {
        guard let firstVC = presentingViewController as? ViewController else {return}
        firstVC.view.backgroundColor = .white
        
    }
}
