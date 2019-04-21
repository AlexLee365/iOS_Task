//
//  SecondViewController.swift
//  StoryBoardSegueTask
//
//  Created by Alex Lee on 03/04/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var animalImageView: UIImageView!
    
    var countChange = 0
    var selectImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var selectImagefile = UIImage(named: selectImage)
        animalImageView.image = selectImagefile

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func allPlusOneButton(_ sender: Any) {
        countChange += 1
    }
}
