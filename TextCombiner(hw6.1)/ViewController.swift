//
//  ViewController.swift
//  TextCombiner(hw6.1)
//
//  Created by Anna Kulieshova on 02.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var operatorField: UITextField!
    @IBOutlet weak var outputTextLabel: UILabel!
    
    @IBAction func action(_ sender: Any) {
        
        let firstDoubleOptional = Double(firstNumber.text ?? "")
        let secondDoubleOptional = Double(secondNumber.text ?? "")
        let operatorOptional = operatorField.text ?? nil
        var fieldsNeedToBeCleared = false
        
        if let firstNum = firstDoubleOptional, let secondNum = secondDoubleOptional, let oper = operatorOptional {
            guard !oper.isEmpty else{outputTextLabel.text! = "Please fill out the Operator field"; return}
            
            
            fieldsNeedToBeCleared = true
            
            let operatorAuthorized: Array = ["+","-","/","*"]
            var operatorInserted: String {
                for el in operatorAuthorized {
                    if el == oper {return el}
                }
                fieldsNeedToBeCleared = false
                outputTextLabel.text! = "WRONG OPERATOR"
                return "Wrong operator"
            }
            if operatorInserted == "+" {
                outputTextLabel.text! = "\(firstNum + secondNum)"
            }
            else if operatorInserted == "-" {
                outputTextLabel.text! = "\(firstNum - secondNum)"
            }
            else if operatorInserted == "/" {
                outputTextLabel.text! = "\(firstNum / secondNum)"
            }
            else if operatorInserted == "*" {
                outputTextLabel.text! = "\(firstNum * secondNum)"
            }
            else {
                fieldsNeedToBeCleared = false
            }
        }
        else {
            outputTextLabel.text! = "WRONG DATA"
            fieldsNeedToBeCleared = false
        }
        
        if fieldsNeedToBeCleared {
            firstNumber.text = ""
            secondNumber.text = ""
            operatorField.text = ""
        }
    }
}
