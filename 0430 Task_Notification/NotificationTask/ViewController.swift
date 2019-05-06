//
//  ViewController.swift
//  NotificationTask
//
//  Created by Alex Lee on 03/05/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redValue: CGFloat = 0.5
    var greenValue: CGFloat = 0.5
    var blueValue: CGFloat = 0.5
    var alphaValue: CGFloat = 0.5
    
    @IBOutlet weak var tfForNoti: UITextField!
    
    var notiCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tfForNoti.borderStyle = .roundedRect
//        tfForNoti.layer.borderWidth = 0.5
//        tfForNoti.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0 :
            print("R : ", sender.value)
            redValue = CGFloat(sender.value)
        case 1:
            print("G : ", sender.value)
            greenValue = CGFloat(sender.value)
        case 2:
            print("B : ",sender.value)
            blueValue = CGFloat(sender.value)
        case 3:
            print("Alpha : ", sender.value)
            alphaValue = CGFloat(sender.value)
        default :
            break
        }
        
    }
    
    @IBAction func btnDidTap(_ sender: UIButton) {
        var secondVC = SecondViewController()
        
        secondVC.addNotification()
        present(secondVC, animated: true)
        
        notiCenter.post(name: Notification.Name("ColorNoti"), object: [redValue, greenValue, blueValue, alphaValue], userInfo: nil)
    }
    
    @IBAction func tfEditingChanged(_ sender: UITextField) {
        var input = sender.text
        
        notiCenter.post(name: Notification.Name("textFieldNotification"), object: sender)
    }
}

