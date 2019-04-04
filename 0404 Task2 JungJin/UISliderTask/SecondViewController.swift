//
//  SecondViewController.swift
//  UISliderTask
//
//  Created by Alex Lee on 04/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var dismissButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redColor : CGFloat = CGFloat(StoredColorValue.staticStoredColorValue.redValue)
        let greenColor : CGFloat = CGFloat(StoredColorValue.staticStoredColorValue.greenValue)
        let blueColor : CGFloat = CGFloat(StoredColorValue.staticStoredColorValue.blueValue)
        
//        view.backgroundColor = .init(red: StoredColorValue.staticStoredColorValue.redValue, green: StoredColorValue.staticStoredColorValue.greenValue, blue: StoredColorValue.staticStoredColorValue.blueValue, alpha: 1)
       
        view.backgroundColor = .init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        
        dismissButton.frame = CGRect(x: view.frame.width/2-50, y: view.frame.width/2, width: 100, height: 50)
        dismissButton.setTitle("dismiss", for: .normal)
        dismissButton.setTitleColor(.white, for: .normal)
        view.addSubview(dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissButtonClicked), for: .touchUpInside)
//        dismissButton.backgroundColor = .white
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func dismissButtonClicked() {
        
        dismiss(animated: true)
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
