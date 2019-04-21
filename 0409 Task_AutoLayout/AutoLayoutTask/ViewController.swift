//
//  ViewController.swift
//  AutoLayoutTask
//
//  Created by Alex Lee on 09/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//



//1. 오토레이아웃 연습해보기 (별도 이미지 참고)
//    - 5개의 뷰를 생성하고 높이는 150으로 통일
//- Safe Area Top 과 60 의 거리
//- 가장 왼쪽의 뷰는 leading 20, 가장 오른쪽의 뷰는 trailing 20으로 설정하고 각 view 간의 거리는 8로 고정
//- 각 위치에서 오른쪽에 있는 뷰는 왼쪽 뷰 width 의 0.7배에서 해당 위치의 인덱스만큼 뺀 값을 width 값으로 지님
//e.g.
//2번째 뷰의 width는 1번째 뷰 width의 0.7배보다 1 작게 설정
//3번째 뷰의 width는 2번째 뷰 width의 0.7배보다 2 작게 설정
//
//[ 도전 과제 ]
//1. 1차 테스트 3번 과제에서 스토리보드로 프레임 잡은 객체들에 대해 오토레이아웃 적용해보기
//- 노란색 워닝이 나오지 않도록 모두 조정해보기

import UIKit

class ViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindTo(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    
   


}

