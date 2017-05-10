//
//  ViewController.swift
//  Calculator
//
//  Created by Sean on 5/1/17.
//  Copyright © 2017 Sean Chandler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!
    
    var userIsTypeing : Bool = false
    
    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func numberButtonAction(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let currentDisplay = display!.text!;
        
        if userIsTypeing {
            display.text = currentDisplay + digit;
        }
        else {
            display.text = digit;
            userIsTypeing = true;
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsTypeing = false;
        if let matchematicalSymbol = sender.currentTitle {
            
            switch matchematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
}

