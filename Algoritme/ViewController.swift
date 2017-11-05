//
//  ViewController.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/4/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var kInput: NSTextField!
    @IBOutlet weak var resultTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let onlyIntFormatter = OnlyIntegerValueFormatter()
        kInput.formatter = onlyIntFormatter
    }
    
    @IBAction func createChild(_ sender: Any) {
        if kInput.stringValue.isEmpty {
            return
        }
        
        let orderBased = OrderBased(k: Int(kInput.intValue))
        resultTextField.stringValue =
        "Parent 1:     \(orderBased.parent1) \nParent 2:     \(orderBased.parent2) \nNew Child:  \(orderBased.createChild())"
    }
    
}

