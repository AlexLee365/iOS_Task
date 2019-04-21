//
//  SecondViewController.swift
//  DelegateSingletonTask
//
//  Created by Alex Lee on 04/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate : class {
    func labelCovered () -> String
}

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var labelString = ""
    
    weak var delegate : SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        labelString = UserDefaults.standard.string(forKey: "inputText") ?? ""     // UserDefaults 사용
//        resultLabel.text = labelString
        
//        resultLabel.text = LabelString.staticLabelString.labelString       // Singleton객체 사용
        
        resultLabel.text = delegate?.labelCovered()
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
