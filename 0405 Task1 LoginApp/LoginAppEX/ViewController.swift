//
//  ViewController.swift
//  LoginAppEX
//
//  Created by Alex Lee on 05/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//
//
//[ 로그인 페이지 필수 구현 기능 ]
//1. 이미지와 동일하게 UI 구현  (스토리보드와 코드 자유)
//2. 텍스트 필드는 delegate 사용
//3. 키보드에 textField 가 가릴 수 있으므로 키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
//4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동
//5. 메인 화면에서는 입력받은 아이디를 출력하는 Label 을 띄우고 다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성



//[ 로그인 페이지 옵션 기능 ]
//1. 텍스트필드에 입력할 수 있는 최대 글자 수는 20자까지.
//2. 아이디와 비밀번호는 모두 4 ~ 16자 사이여야 함.
//3. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기
//
//
//[ 도전 과제 ]
//1.
//회원가입 페이지를 만든 뒤 회원 가입한 유저의 아이디와 비밀번호를 추가하고
//그것으로도 로그인 할 수 있도록 구현하기
//(해당 건은 답안 없음)

//6. 한 번 로그인에 성공했으면 Sign Out을 하기 전에는 앱을 껏다 켜도 자동 로그인된 상태로 메인 화면으로 진입



import UIKit

class ViewController: UIViewController {

    
//    < cornerRadius >
//    someView.layer.cornerRadius = 30
//
//    < UIView Animation >
//    UIView.animate(withDuration: 2) {
//    self.someView.frame.origin.y += 50
//    }
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var ContainerView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    var check = false
    var IDCorrect = false
    var PWCorrect = false
    
    var ID = "Alex"
    var PW = "1234"
    var inputID = ""
    var inputPW = ""
    
    var userDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContainerView.backgroundColor = .white
        signInButton.layer.cornerRadius = 5
        
    }
    
    
    
    @IBAction func unwindToVCFromSecondVC(_ unwindSegue: UIStoryboardSegue) {
        userDefaults.set(false, forKey: "LoginState")
    }
    @IBAction func unwindToVCFromSignUPVC(_ unwindSegue: UIStoryboardSegue) {
//        guard let SingUPVC = unwindSegue.source as? SignUpViewController else { return }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ID = userDefaults.string(forKey: "UserID") ?? "Alex"
        PW = userDefaults.string(forKey: "UserPW") ?? "1234"
        
        emailTextField.text = ""
        pwTextField.text = ""
    }
    
    

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "LogIn" {
            print(inputID.count, inputPW.count)
            
            guard inputID.count>3 && inputID.count<16 && inputPW.count>3 && inputPW.count<16 else {
                
                alert("로그인 실패", "아이디와 비밀번호는 \n 4자~16자 사이로 입력해주세요")
                
                return false
            }
            
            guard IDCorrect&&PWCorrect else {
                
                alert("로그인 실패", "아이디와 비밀번호가 맞지않습니다")
                
                if (IDCorrect == false && PWCorrect == false ) {
                    UIView.animate(withDuration : 1) {
                        self.emailTextField.backgroundColor = .red
                        self.pwTextField.backgroundColor = .red
                    }
                    UIView.animate(withDuration : 1) {
                        self.emailTextField.backgroundColor = .white
                        self.pwTextField.backgroundColor = .white
                    }
                } else if IDCorrect == false {
                    UIView.animate(withDuration : 1) {
                        self.emailTextField.backgroundColor = .red
                    }
                    UIView.animate(withDuration : 1) {
                        self.emailTextField.backgroundColor = .white
                    }
                } else if PWCorrect == false {
                    UIView.animate(withDuration : 1) {
                        self.pwTextField.backgroundColor = .red
                    }
                    UIView.animate(withDuration : 1) {
                        self.pwTextField.backgroundColor = .white
                    }
                }
                return false
            }
            userDefaults.set(true, forKey: "LoginState")
            return true
            
        } else if identifier == "SingUP" {
            return true
        }
        userDefaults.set(true, forKey: "LoginState")
        return true
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "LogIn" {
//            guard let secondVC = segue.destination as? SecondViewController else {return}
//            secondVC.ID = self.ID
            userDefaults.set(ID, forKey: "ID")
            
        } else if (segue.identifier == "SingUp") {
            
        }
        
        
    }
    
    var inputText = ""
    
    @IBAction func textFieldChanged(_ sender: UITextField) {

        switch sender.tag {
            case 0 :
                IDCorrect = ID == sender.text! ? true : false
                inputID = sender.text!
                print(IDCorrect)
            case 1 :
                PWCorrect = PW == sender.text! ? true : false
                inputPW = sender.text!
                print(PWCorrect)
            default : break
        }
        
        if (IDCorrect && PWCorrect) == false {
            
            
        }
        
        if sender.text!.count <= 20 {
            inputText = sender.text ?? ""
        } else {
            sender.text = inputText
        }
        
    }
    
    func alert(_ title : String, _ message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    
    
    
}

extension ViewController : UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        guard check == false else { return }
        
        textField.becomeFirstResponder()
        
        UIView.animate(withDuration : 0.5) {
            self.ContainerView.frame.origin.y -= 200
            
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        check = false
        
        UIView.animate(withDuration : 0.5) {
            self.ContainerView.frame.origin.y += 200
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        var inputValue = textField.text! + string
//        print(inputValue)
//        print(range)
//
//        switch textField.tag {
//        case 0 :
//            IDCorrect = ID == inputValue ? true : false
//        case 1 :
//            PWCorrect = PW == inputValue ? true : false
//        default : break
//        }
//
//
//        return true
//    }
}



