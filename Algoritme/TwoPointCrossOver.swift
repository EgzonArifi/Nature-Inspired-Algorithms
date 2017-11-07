//
//  TwoPointCrossOver.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/5/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

//1. Choose two crossover points j and k randomly, making sure that 1 <= j < k < L
//2. Genes 1 to j of the child will be the same as genes 1 to j of parent 1;
//3. genes j+1 to k of the child will be the same as genes j to k of parent 2.
//4. the remainder of the child will be the same as parent 1.
class TwoPointCrossOver {
    
    private(set) var parent1 = [1, 3, 4, 3, 6, 1, 3, 6, 7, 3, 1, 4];
    private(set) var parent2 = [3, 5, 2, 6, 7, 1, 2, 5, 4, 2, 2, 8];
    private(set) var j: Int
    private(set) var k: Int
    
    init(j: Int, k: Int) {
        self.j = j
        self.k = k
    }
    
    func createChild() -> [Int] {
        
        var newChild = [Int]()
        
        //Begin with first gene to j, from parent 1
        for index in 0...j {
            newChild.append(parent1[index])
        }
        
        //Begin j+1 to k, from parent 2
        for index in j+1...k {
            newChild.append(parent2[index])
        }
        
        if newChild.count < parent1.count {
            //Begin with first gene to k+1, from parent 1
            for index in k+1..<parent1.count {
                newChild.append(parent1[index])
            }
        }
        
        return newChild
    }
}
