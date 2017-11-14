//
//  TwoPointCrossOverVC.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/5/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class TwoPointCrossOverVC: NSViewController {

    @IBOutlet weak var inputs: NSTextField!
    @IBOutlet weak var resultView: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createChild(_ sender: Any) {
    
        let parameters = generateParams()
        inputs.stringValue = "J: \(parameters.j) K: \(parameters.k)"
        let onePointCrossover = TwoPointCrossOver(j: parameters.j, k: parameters.k)
        resultView.stringValue =
        "Parent 1:     \(onePointCrossover.parent1) \nParent 2:     \(onePointCrossover.parent2) \nNew Child:  \(onePointCrossover.createChild())"
    }

    
    func generateParams() -> (j: Int, k: Int) {
        var values = Array(0...10)
        values.shuffle()
        var twoValues = values.prefix(2)
        twoValues.sort {
            return $0 < $1
        }
        return (twoValues.first!, twoValues.last!)
    }
    
}
