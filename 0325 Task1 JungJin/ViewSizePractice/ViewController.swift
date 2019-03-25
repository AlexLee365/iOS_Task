//
//  ViewController.swift
//  ViewSizePractice
//
//  Created by Alex Lee on 25/03/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .gray
//        self.view = view
//    }
    
//    func setupSuperview(superview: UIView) -> UIView {
//        let greenView = UIView()
//        greenView.frame = CGRect(x: 15, y: 15, width: superview.frame.size.width-30, height: 100)
//        greenView.backgroundColor = .blue
//        view.addSubview(greenView)
//        return greenView
//    }
    
//    let aView = UIView()
    let redView = UIView()
    let blueView = UIView()
    let greenView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        aView.frame = CGRect(x: 15, y: view.frame.maxY-115, width: view.frame.width - 30, height: 100)
//        aView.backgroundColor = .blue
//        view.addSubview(aView)
        
        blueView.frame = CGRect(x: 30, y: 30, width: view.frame.width-60, height: view.frame.height-60)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)

        redView.frame = CGRect(x: 30, y: 30, width: view.frame.width-120, height: view.frame.height-120)
        redView.backgroundColor = .red
        blueView.addSubview(redView)
        
        greenView.frame = CGRect(x: 30, y: 30, width: view.frame.width-180, height: view.frame.height-180)
        greenView.backgroundColor = .green
        redView.addSubview(greenView)

//        aView.bounds.origin = CGPoint(x: 50, y: 50)
        
    }
//
//    func aViewSet() {
//        aView.frame = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: 100)
//        view.addSubview(aView)
//    }
}

