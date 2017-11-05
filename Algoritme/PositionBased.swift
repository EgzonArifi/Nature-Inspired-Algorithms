//
//  PositionBased.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/4/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

//First, make the child a copy of parent 1.
//• Next, randomly choose k distinct gene positions of
//the child. Let V be the set of gene values at these
//positions.
//• Next, copy the genes of parent 2 that are not in V into
//the child, overwriting the child’s other genes, in their
//parent 2 order.

class PositionBased {
    
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
        let randomGenes = generateRandomGenes(genes: parent1)//[1, 4, 5, 8]
        print("random genes --- \(randomGenes)")
        
        var selectedChars = arrayWithCharsFromIndexes(array: randomGenes)
        print("selected chars --- \(selectedChars)")
        
        //Temp from parent 2
        var tempFromParent2 = [String]()
        for index in 0..<parent2.count {
            if !selectedChars.contains(parent2[index]) {
                tempFromParent2.append(parent2[index])
            }
        }
        print("removing selected chars from parent 2 --- \(tempFromParent2)")
     
        //Create child
        var newChild = [String]()
        for index in 0..<randomGenes.count+tempFromParent2.count {
            if randomGenes.contains(index) {
                newChild.append(selectedChars.first!)
                selectedChars.removeFirst()
            } else {
                newChild.append(tempFromParent2.first!)
                tempFromParent2.removeFirst()
            }
        }
        
        return newChild
    }
    
    func generateRandomGenes(genes: [String]) -> [Int] {
        
        var temp = [Int]()
        for i in 0..<genes.count {
            temp.append(i)
        }
        
        temp.shuffle()
        return Array(temp.prefix(k))
    }
    
    func arrayWithCharsFromIndexes(array: [Int]) -> [String] {
        var temp = [String]()
        for i in 0..<array.count {
            temp.append(parent1[array[i]])
        }
        return temp;
    }

    
}
