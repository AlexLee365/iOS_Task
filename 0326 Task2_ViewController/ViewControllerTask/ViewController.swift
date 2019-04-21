//
//  ViewController.swift
//  ViewControllerTask
//
//  Created by Alex Lee on 27/03/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//



// 과제2
//> AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성.
//> AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton()
    let numberlabel = UILabel()
    
//    var data = 0
    static var number = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.frame = CGRect(x: view.frame.width/2-150, y: 50, width: 300, height: 100)
        label.text = "첫번째 뷰의 레이블"
        
        
        numberlabel.frame = CGRect(x: view.frame.width/2-150, y: 100, width: 300, height: 100)
        numberlabel.text = String(ViewController.number)
        
        
        button.frame = CGRect(x: view.frame.width/2-50, y: 150, width: 100, height: 50)
        button.setTitle("두번째 뷰로 가기", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
       
        
        view.addSubview(label)
        view.addSubview(numberlabel)
        view.addSubview(button)
        
    }
    
    @objc func didTapButton () {
        let secondVC = SecondViewController()
//        secondVC.number = data + 1
        SecondViewController.number += 1            // 타입 프로퍼티 (static) 이용해서 접근해봄
        present(secondVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        numberlabel.text = String(ViewController.number)
    }


}

