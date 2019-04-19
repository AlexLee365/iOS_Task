//
//  AddFriendViewController.swift
//  FakeKakaoTask
//
//  Created by Alex Lee on 06/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

protocol FirstToSecondDelegate {
    func delegateEX() -> [String]
}

class AddFriendViewController: UIViewController {

    var inputTextField = UITextField()
    var okButton = UIButton()
    var inputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextField.frame = CGRect(x: view.frame.width/2-100, y: 250, width: 200, height: 50)
        view.addSubview(inputTextField)
        inputTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        inputTextField.placeholder = "친구이름을 입력하세요"
        inputTextField.textAlignment = .center
        inputTextField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        
        okButton.frame = CGRect(x: view.frame.width/2-50, y: 350, width: 100, height: 50)
        okButton.setTitle("친구추가", for: .normal)
        okButton.setTitleColor(.blue, for: .normal)
        okButton.addTarget(self, action: #selector(okButtonClicked), for: .touchUpInside)
//        okButton.
        view.addSubview(okButton)
        
        
        
    }
    
    @objc func textFieldEditingChanged(_ sender : UITextField) {
        inputText = sender.text ?? ""
        
    }
    
    
    
    @objc func okButtonClicked() {
        guard inputText.count >= 1 else {
            alert("친구 추가 실패", "친구 이름을 입력해주세요")
            return
        }
        
        alert("친구 추가 성공", "친구 \(inputText) 이(가) 추가되었습니다")
        Friends.shared.list.append(inputText)
        print(inputText)
    }
    
    @objc func textFieldDidEndEditing() {
        inputTextField.resignFirstResponder()
    }
    
    func alert(_ title : String, _ message : String) {
        let alertCon = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertCon.addAction(okAction)
        
        present(alertCon, animated : true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

