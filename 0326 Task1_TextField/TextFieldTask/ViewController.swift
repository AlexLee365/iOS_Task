//
//  ViewController.swift
//  TextFieldTask
//
//  Created by Alex Lee on 26/03/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//


//> 과제1
//> 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//> 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.textColor = .red
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.text = "숫자를 입력하세요"
        
        inputTextField.becomeFirstResponder()
        
    }
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        
        switch (sender.text!).count {
        case 0 :
            resultLabel.text = "숫자를 입력하세요"
            resultLabel.textColor = .red
            resultLabel.font = UIFont.systemFont(ofSize: 20)
        default :
            resultLabel.text = sender.text
            resultLabel.font = UIFont.systemFont(ofSize: 40)
//        resultLabel.font = UIFont.boldSystemFont(ofSize: 40)
            resultLabel.textColor = .blue
        }
        
        
        
    }
    
    @IBAction func didEndOnExit(_ sender: UITextField) {
        resultLabel.textColor = .red
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        
    }
    
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
        
        if (sender.text!).count > 0{
            resultLabel.text = sender.text
            resultLabel.font = UIFont.systemFont(ofSize: 40)
            resultLabel.textColor = .blue
        }

    }
    
    
    @IBAction func editingDidEnd(_ sender: Any) {
    }
    
    
    @IBAction func primaryActionTrigger(_ sender: Any) {
    }
}

