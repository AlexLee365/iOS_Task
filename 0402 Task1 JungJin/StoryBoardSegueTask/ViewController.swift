//
//  ViewController.swift
//  StoryBoardSegueTask
//
//  Created by Alex Lee on 03/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit


//스토리보드 이용할 것
//    - FirstVC 에 개, 고양이, 새 라는 이름의 UIButton 3개 생성
//- SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
//- FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
//(이미지는 구글링 등을 통해 활용)
//- 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 넘어서면 화면이 전환되지 않도록 막기
//- 그리고 SecondVC 에 추가로 UIButton 을 하나 더 생성하여 그 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가되도록 구현
//
//
//3. 클래스 매니저 과제
//- 첫번째 뷰에 레이블과 버튼을 생성하고 버튼을 통해 두번쨰 뷰로 이동.
//- 두번째 뷰에는 segmentedController 를 생성하고 선택한값을 첫번째 뷰의 레이블에 띄우세요.

class ViewController: UIViewController {
    
    @IBOutlet weak var dogCountLabel: UILabel!
    @IBOutlet weak var catCountLabel: UILabel!
    @IBOutlet weak var birdCountLabel: UILabel!
    
    
    
    var dogImage : UIImage? = UIImage (named: "dogImage")
    var catImage : UIImage? = UIImage(named: "catImage")
    var birdImage : UIImage? = UIImage(named: "birdImage")
    
    var dogCount = 0 {
        didSet {
            dogCountLabel.text = String(dogCount)
        }
    }
    var catCount = 0 {
        didSet {
            catCountLabel.text = String(catCount)
        }
    }
    var birdCount = 0 {
        didSet {
            birdCountLabel.text = String(birdCount)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let secondVC = unwindSegue.source as? SecondViewController else {return}
        
        dogCount += secondVC.countChange
        catCount += secondVC.countChange
        birdCount += secondVC.countChange
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return dogCount<=8 && catCount<=10 && birdCount<=15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let secondVC = segue.destination as? SecondViewController else {return}
        
        
        switch segue.identifier {
        case "DogPresent" :
            secondVC.selectImage = "dogImage"
            dogCount += 1
        case "CatPresent" :
            secondVC.selectImage = "catImage"
            catCount += 1
        case "BirdPresent" :
            secondVC.selectImage = "birdImage"
            birdCount += 1
        default :
            break
            
        }
    }


}

