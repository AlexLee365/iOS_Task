//
//  SingUpViewController.swift
//  LoginAppEX
//
//  Created by Alex Lee on 06/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var check = false
    @IBOutlet weak var containerView: UIView!
    
    var inputID = ""
    var inputPW = ""
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    

    @IBAction func TFEditingChanged(_ sender: UITextField) {
        
        
        switch sender.tag {
        case 0 :
            inputID = sender.text ?? ""
        case 1 :
            inputPW = sender.text ?? ""
        default :
            break
        }
        
        
    }
    
    @IBAction func signUPButtonClicked(_ sender: Any) {
        
        guard inputID.count>3 && inputID.count<16 && inputPW.count>3 && inputPW.count<16 else {
            alert("회원가입 실패", "아이디와 비밀번호는 \n 4자~16자 사이로 입력해주세요")
            return
        }
        
        let SuccessAlert = UIAlertController(title: "Message", message: "회원가입을 축하합니다", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        SuccessAlert.addAction(OKAction)
        present(SuccessAlert, animated: true)
        
        userDefaults.set(inputID, forKey: "UserID")
        userDefaults.set(inputPW, forKey: "UserPW")
        
        
    }
    
    func alert(_ title : String, _ message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    
    
}



extension SignUpViewController : UITextFieldDelegate {

    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        guard check == false else { return }
        textField.becomeFirstResponder()
        
        UIView.animate(withDuration : 0.5) {
            self.containerView.frame.origin.y -= 200
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        check = false
        
        UIView.animate(withDuration : 0.5) {
            self.containerView.frame.origin.y += 200
        }
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
