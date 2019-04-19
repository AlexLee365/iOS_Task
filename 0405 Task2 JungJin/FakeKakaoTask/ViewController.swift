//
//  ViewController.swift
//  FakeKakaoTask
//
//  Created by Alex Lee on 06/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//
//
//영상과 같이 코드로 구현하시오.
//
//1. UITabbarController에 두개의 ViewController를 생성
//2. 첫번째 ViewController 에 UINavigationController 연결, 친구목록을 표현할 UILabel 생성
//3. 친구추가 ViewController 에서 UITextField 를 생성하고 이름을 입력
//4. TextField 에 입력된 값에 따라 AlertController 띄우기
//5. 첫번째 ViewController 에 돌아왔을때 친구목록 Label 에 이름 표시
//
//ps. (도전과제) 추가된 친구의 이름을 델리게이트패턴으로 구현해주세요~

import UIKit

class Friends {
    static var shared = Friends()
    var list : [String] = []
}

class ViewController: UIViewController {
    
    var friendListView = UIView()
    var friendListLabel = UILabel()
    
    var total = ""
    var orderCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        friendListView.frame = CGRect(x: 50, y: 250, width: view.frame.width-100, height: view.frame.height-500)
//        view.addSubview(friendListView)
        
        friendListLabel.frame = CGRect(x: 50, y: 250, width: view.frame.width-100, height: view.frame.height-500)
        
//        friendListLabel.frame = CGRect(x: 50+friendListView.frame.width/2-50, y: 250, width: 100, height: view.frame.height-600)
        
        friendListLabel.textColor = .black
        friendListLabel.backgroundColor = .cyan
        friendListLabel.textAlignment = .center
        
        view.addSubview(friendListLabel)
//        friendListLabel.backgroundColor = .yellow
        
        
        title = "Friend"
        
        
        if #available(iOS 11.0, *) {        // ios 11이상만 기능 구현 되도록? 해준부분???
            navigationController?.navigationBar.prefersLargeTitles = true
        }
            let barButton = UIBarButtonItem(title: "Add Friends", style: .done, target: self, action: #selector(pushViewController(_:)))
            navigationItem.rightBarButtonItem = barButton       // addsubview가 아닌 네비게이션 아이템 => "오른쪽버튼 = 넣어줄 버튼"
        }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        friendListLabel.lineBreakMode = .byWordWrapping
        
        
        
        friendListLabel.numberOfLines = 0
        
        friendListLabel.textAlignment = .center
        
        print("싱글톤객체 : ",Friends.shared.list)
        
//        if Friends.shared.list.count > 0 {
//            for i in orderCount...Friends.shared.list.count-1 {
//                if total == "" {                        // 처음 아무 데이터도 없을땐 바로 total 에 첫번째 값 입력
//                    total = Friends.shared.list[i]
//                } else {                                // total에 데이터가 있을땐 공백 후에 데이터 추가
//                    total = total + "\n" + Friends.shared.list[i]
//                }
//            }
//            orderCount = (Friends.shared.list.count-1) + 1      // 다음번에 viewWillAppear가 실행되서 for문이돌때는 이전에 total에 저장했던 배열의 마지막 index를 저장해서 그다음부터 다시 label에 출력될 수 있도록 orderCount지정
//        }
        total = ""
        for i in Friends.shared.list {
            total += "\n" + i
        }
        
        print("total : ", total)
        
        guard !(total == "") else {
            friendListLabel.text = "친구없음"
            return
        }
        
        friendListLabel.text = total
        
    }
    
    
        
        @objc func pushViewController(_ sender : Any) {
            let addFriendVC = AddFriendViewController()
            navigationController?.pushViewController(addFriendVC, animated: true)
    }
}
