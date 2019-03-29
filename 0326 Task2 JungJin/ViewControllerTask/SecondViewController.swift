//
//  SecondViewController.swift
//  ViewControllerTask
//
//  Created by Alex Lee on 27/03/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
//    var data = 0
    static var number = 0
    
    let label = UILabel()
    let button = UIButton()
    let numberlabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        label.frame = CGRect(x: view.frame.width/2-150, y: 50, width: 300, height: 100)
        label.text = "두번째 뷰의 레이블"
        
        numberlabel.frame = CGRect(x: view.frame.width/2-150, y: 100, width: 300, height: 100)
        numberlabel.text = String(SecondViewController.number)
        
        button.frame = CGRect(x: view.frame.width/2-50, y: 150, width: 100, height: 50)
        button.setTitle("첫번째 뷰로 가기", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        
        view.addSubview(label)
        view.addSubview(numberlabel)
        view.addSubview(button)
        
        view.backgroundColor = .gray
    }
    
    @objc func didTapButton() {
        guard let a = presentingViewController as? ViewController else{
            return
        }
        
//        a.data = number
        ViewController.number += 1                      // 타입 프로퍼티 (static) 이용해서 접근해봄
        dismiss(animated: true, completion: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        numberlabel.text = String(SecondViewController.number)
    }

}
