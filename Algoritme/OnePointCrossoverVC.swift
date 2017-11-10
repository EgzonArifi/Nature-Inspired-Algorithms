//
//  OnePointCrossover.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/5/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class OnePointCrossoverVC: NSViewController {

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
        
        let onePointCrossover = OnePointCrossover(k: Int(kInput.intValue))
        resultView.stringValue =
        "Parent 1:     \(onePointCrossover.parent1) \nParent 2:     \(onePointCrossover.parent2) \nNew Child:  \(onePointCrossover.createChild())"
    }
}
