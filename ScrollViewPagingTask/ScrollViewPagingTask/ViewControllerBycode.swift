//
//  ViewControllerBycode.swift
//  ScrollViewPagingTask
//
//  Created by Alex Lee on 11/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

//UIScrollView 에 UIPageControl을 사용하여 현재 페이지를 표시하는 화면 만들기
//(별도 이미지 참고)
//스크롤뷰 페이징 힌트
//- UIPageControl 객체 사용, Delegate 이용(scroll 관련),  pagingEnabled 속성 참고

class ViewControllerBycode: UIViewController, UIScrollViewDelegate{
    
    let pageControl = UIPageControl()
    let scrollView = UIScrollView()
    
    var firstView = UIView()
    var secondView = UIView()
    var thirdView = UIView()
    var fourthView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        activateLayoutAnchors()
        
        print(scrollView.contentSize)
        
    }
    
    
    private func activateLayoutAnchors() {
        // iOS 9.0 이상 에서만 쓸수있음?????
        view.addSubview(scrollView)             // constraint를 걸어서 autoLayout 잡아줄땐 addsubview를 먼저 해줘야함
        view.addSubview(pageControl)
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        scrollView.addSubview(thirdView)
        scrollView.addSubview(fourthView)
        
        pageControl.translatesAutoresizingMaskIntoConstraints  = false
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .cyan
        
//        view.bringSubviewToFront(pageControl)
//        scrollView.backgroundColor = .yellow
        
        firstView.backgroundColor = .red
        secondView.backgroundColor = .orange
        thirdView.backgroundColor = .yellow
        fourthView.backgroundColor = .green
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints  = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -200).isActive = true
        
        scrollView.contentSize = CGSize(width: view.frame.width*4, height: view.frame.height-100)
        scrollView.isPagingEnabled = true
        
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        firstView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        firstView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        firstView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 0).isActive = true
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 0).isActive = true
        secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        secondView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 0).isActive = true
        thirdView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        thirdView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
        fourthView.translatesAutoresizingMaskIntoConstraints = false
        fourthView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        fourthView.leadingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: 0).isActive = true
        fourthView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        fourthView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        fourthView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        
        
    }
    
    // scrollViewDelegate 메소드
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    
}
