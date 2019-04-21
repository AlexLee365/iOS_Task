//
//  ViewController.swift
//  UISliderTask
//
//  Created by Alex Lee on 04/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

//Singleton 에 red, green, blue 변수 생성.
//
//firstview 에 UISlider 를 세개 생성하고 슬라이더 각각의 값을 Singleton 에 각각 저장.
//
//secondview 에 backgroundcolor 를 singleton 에서 red, green, blue 값을 참조하여 보여주세요.
//
//(코드로 구현하시오.)

import UIKit

class StoredColorValue {
    static var staticStoredColorValue = StoredColorValue()
    var redValue : Float = 0.0
    var greenValue : Float = 0.0
    var blueValue : Float = 0.0
}


class ViewController: UIViewController {
    
    var sliderRed = UISlider()
    var sliderGreen = UISlider()
    var sliderBlue = UISlider()
    
    var viewRed = UIView()
    var viewGreen = UIView()
    var viewBlue = UIView()
    
    var presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let startingPoint : CGFloat = 200
        
        viewRed.frame = CGRect(x: view.frame.width/2-100, y: startingPoint+50, width: 200, height: 30)
        viewRed.backgroundColor = .red
        view.addSubview(viewRed)
//        viewRed.backgroundColor = .init(red: 0.5, green: 0.5, blue: 0.3, alpha: 1)
        
        
        sliderRed.frame = CGRect(x: view.frame.width/2-100, y: startingPoint+100, width: 200, height: 30)
        view.addSubview(sliderRed)
        sliderRed.tag = 0
        sliderRed.addTarget(self, action: #selector(ColorChanged), for: .valueChanged)
        
        
        viewGreen.frame = CGRect(x: view.frame.width/2-100, y: startingPoint+200, width: 200, height: 30)
        view.addSubview(viewGreen)
        viewGreen.backgroundColor = .green
        
        sliderGreen.frame = CGRect(x: view.frame.width/2-100, y: startingPoint+250, width: 200, height: 30)
        view.addSubview(sliderGreen)
        sliderGreen.tag = 1
        sliderGreen.addTarget(self, action: #selector(ColorChanged), for: .valueChanged)
        
        
        
        viewBlue.frame = CGRect(x: view.frame.width/2-100, y: startingPoint+350, width: 200, height: 30)
        view.addSubview(viewBlue)
        viewBlue.backgroundColor = .blue
        
        sliderBlue.frame = CGRect(x: view.frame.width/2-100, y: startingPoint+400, width: 200, height: 30)
        view.addSubview(sliderBlue)
        sliderBlue.tag = 2
        sliderBlue.addTarget(self, action: #selector(ColorChanged), for: .valueChanged)
        
        presentButton.frame = CGRect(x: view.frame.width/2-75, y: view.frame.maxY-150, width: 150, height: 40)
        view.addSubview(presentButton)
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.blue, for: .normal)
        presentButton.addTarget(self, action: #selector(presentButtonClicked), for: .touchUpInside)
    }
    
    @objc func ColorChanged (_ sender : UISlider) {
        switch sender.tag {
        case 0 :
            StoredColorValue.staticStoredColorValue.redValue = sender.value
            print("RedColor : ", sender.value)
        case 1 :
            StoredColorValue.staticStoredColorValue.greenValue = sender.value
            print("GreenColor : ", sender.value)
        case 2 :
            StoredColorValue.staticStoredColorValue.blueValue = sender.value
            print("BlueColor : ", sender.value)
        default : break
        }
    }
    
    @objc func presentButtonClicked() {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
    }
    
    
}

