//
//  ViewController.swift
//  Shoe Size Converter
//
//  Created by ruby on 19/1/17.
//  Copyright © 2017 Zhexxian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inputValueWomen:Double = 0.0
    var outputValueWomen:Double = 0.0
    var inputValueMen = 0.0
    var outputValueMen = 0.0
    @IBOutlet weak var womenShoeSizeTextField: UITextField!
    
    @IBOutlet weak var menShoeSizeTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func womenButtonPressed(_ sender: UIButton) {
        
        if (womenShoeSizeTextField.text == ""){
                inputValueWomen = 0.0
        }
        else{
            inputValueWomen = Double(womenShoeSizeTextField.text!)!
            
        }
        outputValueWomen = Double(inputValueWomen) + 30.5
        
        messageLabel.text = String(outputValueWomen)
        
    }
    
    
    @IBAction func menButtonPressed(_ sender: UIButton) {
        if (menShoeSizeTextField.text == ""){
            inputValueMen = 0.0
        }
        else{
            inputValueMen = Double(menShoeSizeTextField.text!)!
            
        }
        outputValueMen = Double(inputValueMen) + 30.5
        
        messageLabel.text = String(outputValueMen)
    }

}

