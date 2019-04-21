//
//  ViewController.swift
//  AlertControllerPractice2
//
//  Created by Alex Lee on 25/03/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.text = "0"
        resultLabel.frame = CGRect(x: view.frame.width/2-25, y: 100, width: 50, height: 50)
        
        
        //---------------------------------------버튼 코드 생성----------------------------------------
        let button = UIButton(type: .system)
        button.frame = CGRect(x: view.frame.width/2-25, y: 200, width: 50, height: 50)
        button.setTitle("Plus", for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)            // 버튼 클릭시 didTapButton 메소드 실행되도록
        view.addSubview(button)
        //------------------------------------------------------------------------------------------
    }
    
    @objc func didTapButton(_ sender: Any) {
        
        var numberTextField = UITextField()
        var inputNumber = 1
        
        let alertController = UIAlertController(title: "숫자올리기", message: "숫자를 올리시겠습니까?", preferredStyle: .alert)        // UIAlertController 생성
        
        let okAction = UIAlertAction(title: "yes", style: .default) { _ in              // alert의 ok버튼
            
            if numberTextField.hasText == false {
                
            } else{
                inputNumber = Int(numberTextField.text!) ?? 0
            }
            
            switch inputNumber {
            case 1 :
                self.number += 1
                self.resultLabel.text = String(self.number)
            default :
                self.number += inputNumber
                self.resultLabel.text = String(self.number)
            }
            
        }
        
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)     // alert의 취소버튼
        let resetAction = UIAlertAction(title: "리셋", style: .default) { _ in            // alert의 리셋버튼
            self.number = 0
            self.resultLabel.text = String(self.number)
        }
        
        
        
        
        alertController.addTextField { (input : UITextField) in                         // 생성한 alertController에 TextField생성
            numberTextField = input
        }
        
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(resetAction)
        
        present(alertController, animated: true)
    }
    
// ----------------------------------------스토리보드로 버튼 구현함-----------------------------------------------------------------
//    var number = 0
//
//    @IBAction func didTapButton(_ sender: Any) {
//
//        var numberTextField : UITextField?
//        var inputNumber = 1
//
//        let alertController = UIAlertController(title: "숫자올리기", message: "숫자를 올리시겠습니까?", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "yes", style: .default) { _ in
//
//            if numberTextField?.hasText == false {
//
//            } else{
//                inputNumber = Int(numberTextField!.text!) ?? 0
//            }
//
//            switch inputNumber {
//            case 1 :
//                self.number += 1
//                self.resultLabel.text = String(self.number)
//            default :
//                self.number += inputNumber
//                self.resultLabel.text = String(self.number)
//            }
//
//        }
//
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//        let resetAction = UIAlertAction(title: "리셋", style: .default) { _ in
//            self.number = 0
//            self.resultLabel.text = String(self.number)
//        }
//
//
//        alertController.addTextField { (input : UITextField) in
//            numberTextField = input
//        }
//
//
//        alertController.addAction(okAction)
//        alertController.addAction(cancelAction)
//        alertController.addAction(resetAction)
//
//        present(alertController, animated: true)
//    }
//----------------------------------------------------------------------------------------------------------------------------------
}


