//
//  ViewController.swift
//  ScrollViewPagingTask
//
//  Created by Alex Lee on 11/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(pageNumber)
        
        print("decelerating")
    }


}

