//
//  SecondViewController.swift
//  NotificationTask
//
//  Created by Alex Lee on 03/05/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var notiCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        view.addSubview(button)
        button.frame = CGRect(x: view.center.x-50, y: view.center.y-20, width: 100, height: 40)
        button.setTitle("dismiss", for: .normal)
//        button.backgroundColor = .white
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(dismissBtn), for: .touchUpInside)
    }
    
    @objc func dismissBtn() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func addNotification() {
        notiCenter.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: Notification.Name("ColorNoti"), object: nil)
    }
    
    @objc func didReceiveNotification(_ sender : Notification) {
        guard let receivedObject = sender.object as? [CGFloat] else {return}
        
        view.backgroundColor = UIColor(red: receivedObject[0], green: receivedObject[1], blue: receivedObject[2], alpha: receivedObject[3])
    }

    deinit {
        notiCenter.removeObserver(self)
    }
}
