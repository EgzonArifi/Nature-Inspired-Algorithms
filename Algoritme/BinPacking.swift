//
//  BinPacking.swift
//  Algoritme
//
//  Created by Egzon Arifi on 12/20/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

struct BinPack {
    
    let bin: Int
    let weights: [Float]
}

enum HyperHeuristic: Int {
    case FFA = 1
    case FFD = 2
    case BF1 = 3
}

class BinPacking {
    
    let binCapacity:Float = 5.0
    public private(set) var bins = [BinPack]()
    private var weightsEncoding: [Float]
    
    init(weightsEncoding: [Float], genotype: [Int]) {
        
        self.weightsEncoding = weightsEncoding
     
        var newBin: (position: Int, weight: Float) = (0, 0.0)
        
        for gen in genotype {
            
            switch gen {
                
            case 1: newBin = FFA()
                
            case 2: newBin = FFD()

            case 3: newBin = BF1()
                
            default: newBin = FFA()
                
            }
            
            if self.bins.count > 0 {
                
                var hasAnyPackFreeSpace = false
                
                for (index, bin) in self.bins.enumerated() {
                    
                    let sumedArr: Float = bin.weights.reduce(0, {$0 + $1})
                    
                    let sum = NSNumber(value: sumedArr)
                    let binC = NSNumber(value: 5.0000)
                    let newBinWeight = NSNumber(value: newBin.weight)
                    let newM:Float = binC.floatValue-sum.floatValue
                    let remain = NSNumber(value: newM)
                    
                    if (sum.floatValue.isLess(than: binC.floatValue)) &&
                        (remain.floatValue + 0.0002 >= newBinWeight.floatValue) &&
                        hasAnyPackFreeSpace == false {
                        
                        hasAnyPackFreeSpace = true
                        var lastWeights = bin.weights
                        lastWeights.append(newBin.weight)
                        bins.remove(at: index)
                        let newBinPack = BinPack(bin: bin.bin, weights: lastWeights)
                        bins.insert(newBinPack, at: index)
                        
                    }
                }
                
                if hasAnyPackFreeSpace == false {
                    let newBinPack = BinPack(bin: (self.bins.last?.bin)!+1, weights: [newBin.weight])
                    bins.append(newBinPack)
                }
                
                
            } else {
            
                bins.append(BinPack(bin: 1, weights: [newBin.weight]))
            }
            
            self.weightsEncoding.remove(at: newBin.position)
        }
    }
    
    func FFA() -> (position: Int, weight: Float) {
       return (self.weightsEncoding.index(of: self.weightsEncoding.min()!)!, self.weightsEncoding.min()!)
    }
    
    func FFD() -> (position: Int, weight: Float) {
        return (self.weightsEncoding.index(of: self.weightsEncoding.max()!)!, self.weightsEncoding.max()!)
    }
    
    func BF1() -> (position: Int, weight: Float) {
        
        if bins.count == 0, let w = self.weightsEncoding.index(of:5) {
            return (w, 5)
        }
        
        for bin in self.bins {
            
            for (index,item) in self.weightsEncoding.enumerated() {
                
                let sumedArr = bin.weights.reduce(0, {$0 + $1})
                
                let sum = NSNumber(value: sumedArr)
                let itemBin = NSNumber(value: item)
                let binC = NSNumber(value: 5.0000)
                print("\(sum.floatValue) + \(itemBin.floatValue)   \(sum.floatValue + itemBin.floatValue) == \(binC.floatValue)")
                if sum.floatValue + itemBin.floatValue == binC.floatValue {
                    
                    return (index, item)
                }
            }
        }
        
        return FFA()
    }
    
}
