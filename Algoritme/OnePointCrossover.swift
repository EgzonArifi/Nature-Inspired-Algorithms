//
//  OnePointCrossover.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/5/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

//1. Choose a crossover point k randomly (a number from 1 to L-1)
//2. The first k genes of the child will be the same as the first k genes of parent 1
//3. The genes of the child from gene k+1 onwards will be the same as those of parent 2.
class OnePointCrossover {
 
    private(set) var parent1 = [1, 3, 4, 3, 6, 1, 3, 6, 7, 3, 1, 4];
    private(set) var parent2 = [3, 5, 2, 6, 7, 1, 2, 5, 4, 2, 2, 8];
    private(set) var k: Int
    
    init(k: Int) {
        self.k = k
    }
    
    func createChild() -> [Int] {
        
        //Check if is in range
        if k < 0 || k > parent1.count {
            print("out of range")
            return []
        }
        
        //Create child
        var newChild = [Int]()
        for index in 0..<parent1.count {
            if index < k {
                newChild.append(parent1[index])
            } else {
                newChild.append(parent2[index])
            }
        }
        
        return newChild
    }
}
