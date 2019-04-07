//
//  ViewController.swift
//  Calculator
//
//  Created by Xuechun Wang on 7/4/19.
//  Copyright © 2019 Xuechun Wang. All rights reserved.
//


import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
        resultLabel.textColor = UIColor.black
    }
    
    @IBOutlet weak var resultLabel: UILabel!
        enum Operators: String{
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case Empty = "Empty"
            
    }
    
    var firstNumber = ""
    var secondNumber = ""
    var currentOperator = Operators.Empty
    var displayedNumber = ""
    var result = ""
    
    var userIsInTyping: Bool = false
    @IBAction func numberSelected(sender:
        UIButton) {
        displayedNumber += String(sender.tag)
        resultLabel.text = displayedNumber

    }
    @IBAction  func selectAdd(sender: UIButton){
        selectedOperator (operation: Operators.Add)
    }
    @IBAction  func selectSubtract(sender: UIButton){
        selectedOperator (operation: Operators.Subtract)
    }
    @IBAction  func selectMultiply(sender: UIButton){
        selectedOperator (operation: Operators.Multiply)
    }
    @IBAction  func selectDivide(sender: UIButton){
        selectedOperator (operation: Operators.Divide)
    }
    @IBAction  func selectEqual(sender: UIButton){
        selectedOperator (operation: currentOperator)
    }
    @IBAction  func selectClear(sender:UIButton){
        firstNumber = ""
        secondNumber = ""
        currentOperator = Operators.Empty
        displayedNumber = ""
        result = ""
        
        resultLabel.text = ""
    }



    func selectedOperator(operation: Operators){
        if currentOperator != Operators.Empty{
            
            if displayedNumber != ""{
                secondNumber = displayedNumber
                displayedNumber = ""
                
                switch currentOperator{
                    case Operators.Add:
                    result = String(Double(firstNumber)! + Double(secondNumber)!)
                    case Operators.Subtract:
                    result = String(Double(firstNumber)! - Double(secondNumber)!)
                    case Operators.Divide:
                    result = String(Double(firstNumber)! / Double(secondNumber)!)
                    case Operators.Multiply:
                    result = String(Double(firstNumber)! * Double(secondNumber)!)
                    default:
                    print("error")
                }
                firstNumber = result
                resultLabel.text = result
                currentOperator = operation
            }
            
        }
        
        else{
            firstNumber = displayedNumber
            displayedNumber = ""
            currentOperator = operation
        }
        
        
        
    }
}
