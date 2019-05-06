//
//  ThirdViewController.swift
//  NotificationTask
//
//  Created by Alex Lee on 05/05/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var notiCenter = NotificationCenter.default
    
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(resultLabel)
//        resultLabel.center = view.center
        resultLabel.frame.origin = CGPoint(x: view.center.x-100, y: view.center.y-20)
        resultLabel.frame.size = CGSize(width: 200, height: 40)
        resultLabel.text = "no result"
        resultLabel.textAlignment = .center
    }
    
    func addNotification() {
        notiCenter.addObserver(self, selector: #selector(resultLabelDidReceiveNotification(_:)), name: Notification.Name("textFieldNotification"), object: nil) // 여기서의 object는 뭐지???? 무슨기능??
    }
    
    @objc func resultLabelDidReceiveNotification(_ sender : Notification) {
        guard let textField = sender.object as? UITextField else {return}
        resultLabel.text = textField.text
    }

}
