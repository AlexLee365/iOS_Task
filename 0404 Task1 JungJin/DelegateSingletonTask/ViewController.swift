//
//  ViewController.swift
//  DelegateSingletonTask
//
//  Created by Alex Lee on 04/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//
//
//
//1-1.
//FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
//    - UserDefaults 를 이용한 방법으로 구현
//        - Singleton 을 이용한 방법으로 구현
//            - Delegate 를 이용한 방법으로 구현
//
//[ 도전 과제 ]
//
//1-2.
//일반 과제 1번에서
//delegate 프로토콜과 프로퍼티를 firstVC 에 정의하여 구현했다면 secondVC에,
//이것을 secondVC에 정의해 구현했다면 반대로 firstVC에 정의하여 1번 문제 다시 해결하기
////

import UIKit

//class LabelString {                                     // Singleton 객체 사용
//    static var staticLabelString = LabelString()
//    var labelString = ""
//}

class ViewController: UIViewController {
    
    var inputString = ""

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        textField.delegate = self
        
    }

    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let secondVC = segue.destination as? SecondViewController else {return}         // extension delegate로 이용해서 해봄 (정답이아님)
//        secondVC.labelString = inputString
        
    }
    @IBAction func tfEditingChangfed(_ sender: UITextField) {
//        UserDefaults.standard.set(sender.text, forKey: "inputText")     // UserDefaults 사용
//        LabelString.staticLabelString.labelString = sender.text ?? ""     // Singleton 객체 사용
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
    }
    
    
    @IBAction func textFieldEndOnExit(_ sender: Any) {
    }
    
}

//extension ViewController : UITextFieldDelegate {                //// extension delegate로 이용해서 해봄 (정답이아님)
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        inputString = (textField.text ?? "") + string               // 이 delegate 안에서 생성한 메소드는 마지막문자를 string변수값에 저장함 (나머지 전에 입력한 값들은 textField.text에 저장
//        print(inputString, "    ", string)
//        return true
//    }
//
//}



