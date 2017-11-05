//
//  PositionBasedVC.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/4/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class PositionBasedVC: NSViewController {

    @IBOutlet weak var kInput: NSTextField!
    @IBOutlet weak var resultView: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let onlyIntFormatter = OnlyIntegerValueFormatter()
        kInput.formatter = onlyIntFormatter
    }
    
    @IBAction func createChild(_ sender: Any) {
        
        if kInput.stringValue.isEmpty {
            return
        }
        
        let positionBased = PositionBased(k: Int(kInput.intValue))
        resultView.stringValue =
        "Parent 1:     \(positionBased.parent1) \nParent 2:     \(positionBased.parent2) \nNew Child:  \(positionBased.createChild())"
    }
}
