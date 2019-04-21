//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var inputNum = 0.0
    var currentOperator = ""
    var inputMode = false
    var operatorRepeatState = 0
    
    var operatorDoubleClickCheck = ""

    @IBOutlet weak var currentNumLabel: UILabel!
    
    var numLabelTextToDouble : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func numButtonDidTap(_ sender: UIButton) {
        
        if inputMode == false {
            currentNumLabel.text = sender.titleLabel?.text
            inputMode = true
        } else if inputMode == true {
            currentNumLabel.text = currentNumLabel.text! +  sender.titleLabel!.text!
        }
        
        operatorDoubleClickCheck = "NumberInserted"
    }
    
    
    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
        numLabelTextToDouble = Double(currentNumLabel.text!) ?? 0.0
        
        inputMode = false
        
        switch sender.restorationIdentifier {
        case "Addition" :
            if currentOperator != "+" && operatorDoubleClickCheck != "NumberInserted" {
                currentOperator = "+"
                operatorRepeatState = 0
            }
            if operatorDoubleClickCheck == "+" {
                operatorDoubleClickCheck = "NumberInserted"
                operatorRepeatState = 0
            }
            
            if operatorRepeatState == 0 {
                inputNum = numLabelTextToDouble
            } else if operatorRepeatState >= 1 {
                getResult()
            }
            
            operatorRepeatState += 1
            currentOperator = "+"
            
            operatorDoubleClickCheck = "+"
            
        case "Subtraction" :
            if currentOperator != "-" && operatorDoubleClickCheck != "NumberInserted" {
                currentOperator = "-"
                operatorRepeatState = 0
            }
            if operatorDoubleClickCheck == "-" {
                operatorDoubleClickCheck = "NumberInserted"
                operatorRepeatState = 0
            }
            
            if operatorRepeatState == 0 {
                inputNum = numLabelTextToDouble
            }else if operatorRepeatState >= 1 {
                getResult()
            }
            
            operatorRepeatState += 1
            currentOperator = "-"
            
            operatorDoubleClickCheck = "-"
            
        case "Multiplication" :
            if currentOperator != "*" && operatorDoubleClickCheck != "NumberInserted" {
                currentOperator = "*"
                operatorRepeatState = 0
            }
            if operatorDoubleClickCheck == "*" {
                operatorDoubleClickCheck = "NumberInserted"
                operatorRepeatState = 0
            }
            
            if operatorRepeatState == 0 {
                inputNum = numLabelTextToDouble
            } else if operatorRepeatState >= 1 {
                getResult()
            }
            
            operatorRepeatState += 1
            currentOperator = "*"
            
            operatorDoubleClickCheck = "*"
            
        case "Division" :
            if currentOperator != "/" && operatorDoubleClickCheck != "NumberInserted"{
                currentOperator = "/"
                operatorRepeatState = 0
            }
            if operatorDoubleClickCheck == "/" {
                operatorDoubleClickCheck = "NumberInserted"
                operatorRepeatState = 0
            }
            
            if operatorRepeatState == 0 {
                inputNum = numLabelTextToDouble
            } else if operatorRepeatState >= 1 {
                getResult()
            }
            
            operatorRepeatState += 1
            currentOperator = "/"
            
            operatorDoubleClickCheck = "/"
            
        case "ResultButton" :
            operatorRepeatState = 0
            getResult()
            
        case "ACButton" :
            inputNum = 0
            currentNumLabel.text = "0"
            operatorRepeatState = 0
            currentOperator = ""
            
            operatorDoubleClickCheck = ""
            
        default :break
        }
    }
    
    func getResult() {
        
        numLabelTextToDouble = Double(currentNumLabel.text!) ?? 0.0
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
//        let numString = formatter.string(from: number as NSNumber)
        
        switch currentOperator {
        case "+" :
            currentNumLabel.text = formatter.string(from: (inputNum + numLabelTextToDouble) as NSNumber)
            inputNum = inputNum + numLabelTextToDouble
        case "-" :
            currentNumLabel.text = formatter.string(from: (inputNum - numLabelTextToDouble) as NSNumber)
            inputNum = inputNum - numLabelTextToDouble
        case "*" :
            currentNumLabel.text = formatter.string(from: (inputNum * numLabelTextToDouble) as NSNumber)
            inputNum = inputNum * numLabelTextToDouble
        case "/" :
            currentNumLabel.text = formatter.string(from: (inputNum / numLabelTextToDouble) as NSNumber)
            inputNum = inputNum / numLabelTextToDouble
        default :
            currentNumLabel.text = formatter.string(from: numLabelTextToDouble as NSNumber)
        }
        currentOperator = ""
        
    }
    
    
}
