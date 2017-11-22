//
//  NeighbourhoodVC.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/19/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class NeighbourhoodVC: NSViewController {
    
    @IBOutlet weak var kVariable: NSTextField!
    @IBOutlet weak var bitsLabel: NSTextField!
    @IBOutlet weak var resultLable: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func generateNeighbourhoods(_ sender: Any) {
        
        resultLable.stringValue = ""
        
        var randomBits = [Int]()
        if let k = Int(kVariable.stringValue) {
            randomBits = makeList(n: k)
        } else {
            randomBits = makeList()
        }
        bitsLabel.stringValue = randomBits.description
        
        print(randomBits)
        
        for (index, item) in randomBits.enumerated() {
            
            let bit = flipBit(bit: item)
            printFlippedBit(index: index, randomBits: randomBits, bit: bit)
            
            resultLable.stringValue += "\n\n"
            print(resultLable.stringValue)
        }
    }
    
    func printFlippedBit(index: Int, randomBits: [Int], bit:Int) {
        
        for (i,item) in randomBits.enumerated() {
            if index == i {
                resultLable.stringValue += " [\(bit)] "
            } else {
                resultLable.stringValue += "\(item)"
            }
        }
    }
    
    func makeList(n:Int = 5) -> [Int] {
        var result:[Int] = []
        for _ in 0..<n {
            result.append(Int(arc4random_uniform(2) + 0))
        }
        return result
    }
    
    func flipBit(bit: Int) -> Int {
        if bit == 1 {
            return 0
        }
        return 1
    }
}
