//
//  ViewController.swift
//  SegementAndSegueTask
//
//  Created by Alex Lee on 03/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//



//3. 클래스 매니저 과제
//    - 첫번째 뷰에 레이블과 버튼을 생성하고 버튼을 통해 두번쨰 뷰로 이동.
//        - 두번째 뷰에는 segmentedController 를 생성하고 선택한값을 첫번째 뷰의 레이블에 띄우세요.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let secondVC = unwindSegue.source as? SecondViewController else {return}
        label.text = secondVC.segementValue == "" ? "-1" : secondVC.segementValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: sender)
    }
    @IBAction func presentButton(_ sender: Any) {
        performSegue(withIdentifier: "presentSecond", sender: sender)
    }
    

}

