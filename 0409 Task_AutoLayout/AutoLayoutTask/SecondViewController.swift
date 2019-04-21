//
//  SecondViewController.swift
//  AutoLayoutTask
//
//  Created by Alex Lee on 10/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()
    let fifthView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        firstView.backgroundColor = .red
        secondView.backgroundColor = .orange
        thirdView.backgroundColor = .yellow
        fourthView.backgroundColor = .green
        fifthView.backgroundColor = .blue
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        view.addSubview(fourthView)
        view.addSubview(fifthView)
        
        activateLayoutAnchors()     // 메소드 호출
    }
    
    
    


    
    private func activateLayoutAnchors() {
        // iOS 9.0 이상 에서만 쓸수있음?????
        firstView.translatesAutoresizingMaskIntoConstraints = false     // 오토리사이징 마스크가 잡아주는 걸 꺼줌????  코드로 오토레이아웃 쓰려면 꼭 이걸 꺼줘야함 !!!!
        
        // autoLayout => view.safeAreaLayoutGuide => 오토레이아웃으로 SafeArea 잡을땐 이 변수 이용해야험
        // frame => frame으로 SafeArea 잡을땐 view.safeAreaInset.top
        
        // ------------------------------------------------firstView의 오토레이아웃 ------------------------------------------------
        firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
//        print(view.safeAreaInsets)
        print(view.safeAreaLayoutGuide.topAnchor)   // safeAreaInsets.top 과 같은 목적. 위치의 주소값을 받아와줌
        
        secondView.translatesAutoresizingMaskIntoConstraints  = false
        secondView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 8).isActive = true
        secondView.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        thirdView.translatesAutoresizingMaskIntoConstraints  = false
        thirdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 8).isActive = true
        thirdView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.7, constant: -2).isActive = true
        thirdView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        fourthView.translatesAutoresizingMaskIntoConstraints  = false
        fourthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fourthView.leadingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: 8).isActive = true
        fourthView.widthAnchor.constraint(equalTo: thirdView.widthAnchor, multiplier: 0.7, constant: -3).isActive = true
        fourthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        fifthView.translatesAutoresizingMaskIntoConstraints  = false
        fifthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fifthView.leadingAnchor.constraint(equalTo: fourthView.trailingAnchor, constant: 8).isActive = true
        fifthView.widthAnchor.constraint(equalTo: fourthView.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
        fifthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fifthView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        
        
        
    }
    
    
}
