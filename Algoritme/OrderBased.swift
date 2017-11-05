//
//  OrderBased.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/4/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

//k-gene order based crossover

//First, make the child a copy of parent 1.
//Next, randomly choose k distinct genes of the child.
//Next, reorder the values of these genes so that they match their order in parent 2.
class OrderBased {
    
    private(set) var parent1 = ["A", "C", "J", "I", "B", "D", "E", "G", "H", "F"];
    private(set) var parent2 = ["F", "E", "A", "I", "H", "J", "D", "B", "C", "G"];
    private(set) var k: Int
    
    init(k: Int) {
        self.k = k
    }
    
    func createChild() -> [String] {
        
        //Check if is in range
        if k < 0 || k > parent1.count {
            print("out of range")
            return []
        }
        
        //Next, randomly choose k distinct genes of the child.
        let randomGenes = generatRandomGenes(genes: parent1)//[1, 4, 5, 8]
        print("random genes --- \(randomGenes)")
        
        //Next, reorder the values of these genes so that they match their order in parent 2.
        let newChild = reorderGenesBasedFromParent2(array: randomGenes)
        
        return newChild
    }
    
    func generatRandomGenes(genes: [String]) -> [Int] {
        
        var temp = [Int]()
        for i in 0..<genes.count {
            temp.append(i)
        }
        
        temp.shuffle()
        return Array(temp.prefix(k))
    }
    
    func reorderGenesBasedFromParent2(array: [Int]) -> [String] {
        
        //First, make the child a copy of parent 1.
        var tempChild = parent1
        
        let selectedChars = arrayWithCharsFromIndexes(array: array)
        print("selceted chars --- \(selectedChars)")
        
        var orderedCharsFromParent2 = [Int]()
        for index in 0..<parent2.count {
            if selectedChars.contains(parent2[index]) {
                orderedCharsFromParent2.append(index)
            }
        }
        orderedCharsFromParent2.sort {
            return $0 < $1
        }
        
        var charsFromParent2 = [String]()
        for index in 0..<orderedCharsFromParent2.count {
            charsFromParent2.append(parent2[orderedCharsFromParent2[index]])
        }
        print("ordered genes from parent 2 --- \(charsFromParent2)")
        
        for index in 0..<charsFromParent2.count {
            tempChild.remove(at: array[index])
            tempChild.insert(charsFromParent2[index], at: array[index])
        }
        
        print("new child --- \(tempChild)")
        return tempChild
    }
    
    func arrayWithCharsFromIndexes(array: [Int]) -> [String] {
        var temp = [String]()
        for i in 0..<array.count {
            temp.append(parent1[array[i]])
        }
        return temp;
    }
}
