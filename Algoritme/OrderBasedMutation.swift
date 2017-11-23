//
//  OrderBasedMutation.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/5/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

class OrderBasedMutation {
    
    private(set) var parent = ["A", "C", "J", "I", "B", "D", "E", "G", "H", "F"]
    private(set) var k: Int
    
    init(k: Int) {
        self.k = k
    }
    
    func createChild() -> [String] {
        
        //Check if is in range
        if k < 0 || k > parent.count {
            print("out of range")
            return []
        }
        
        //random j
        let j = Int(arc4random_uniform(UInt32(parent.count)) + 0);

        //chunk with k genes from j position
        var chunk = [String]()
        for index in j..<(j+k) {
            chunk.append(parent[index])
        }
        
        //reverse chunk
        chunk = chunk.reversed()
        
        //Create child
        var newChild = [String]()
        for index in 0..<parent.count {
            if index>j && index<j+k {
                newChild.insert(chunk.first!, at: index)
                chunk.removeFirst()
            } else {
                newChild.append(parent[index])
            }
        }
        
        return newChild
    }
}
