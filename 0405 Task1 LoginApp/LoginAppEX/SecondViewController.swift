//
//  SecondViewController.swift
//  LoginAppEX
//
//  Created by Alex Lee on 05/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    var ID = ""
    
    
    @IBOutlet weak var dismissButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ID = UserDefaults.standard.string(forKey: "ID") ?? ""
        
        resultLabel.text = ID
        
        
        
        
        var loginState = UserDefaults.standard.bool(forKey: "LoginState")
        if loginState == false {
            dismissButton.addTarget(self, action: #selector(dismissButtonClicked), for: .touchUpInside)
            
        }

        // Do any additional setup after loading the view.
    }
    
    @objc func dismissButtonClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)      // 스토리보드를 객체로 받아와야 스토리보드상에서 만든 모든내용들을 가지고 쓸수있음
        storyboard.instantiateInitialViewController()         // 스토리보드에서 화살표가 지정된 뷰컨트롤러 불러오기
        guard let firstVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
        present(firstVC, animated: true)
    }
    
//    override func encodeRestorableState(with coder: NSCoder) {
//        coder.encodeConditionalObject(ID, forKey: "ID")
//        super.encodeRestorableState(with: coder)
//    }
//
//    override func decodeRestorableState(with coder: NSCoder) {
//        resultLabel.text = coder.decodeObject(forKey: "ID") as! String
//        super.decodeRestorableState(with: coder)
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}
