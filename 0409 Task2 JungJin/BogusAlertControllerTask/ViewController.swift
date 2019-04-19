//
//  ViewController.swift
//  BogusAlertControllerTask
//
//  Created by Alex Lee on 10/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else {return}
        secondVC.modalPresentationStyle = .overCurrentContext
        
    }
    
    @IBAction func unwindToFristVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }


}

