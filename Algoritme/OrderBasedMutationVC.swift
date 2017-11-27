//
//  OrderBasedMutationVC.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/5/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class OrderBasedMutationVC: NSViewController {

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
        
        let orderBasedMutation = OrderBasedMutation(k: Int(kInput.intValue))
        resultTextField.stringValue =
        "Parent :     \(orderBasedMutation.parent) \nNew Child:  \(orderBasedMutation.createChild())"
    }

    
}
