//: Playground - noun: a place where people can play

import UIKit
import Foundation

let n = 6

func distributionCountingSort(array: [Int]) -> [Int] {
    
    var s = [Int](repeating: 0, count: n)
    var count = [Int](repeating: 0, count: n)
    
    for i in 0..<n-1 {
        
        for j in i+1..<n {
            if array[i] < array[j] {
                count[j] = count[j] + 1
            } else {
                count[i] = count[i] + 1
            }
        }
    }
    
    for i in 0..<n {
        s[count[i]] = array[i]
    }
    
    return s
}

let array = [13,6,9,3,10,7]
let sorted = distributionCountingSort(array: array)
print(sorted)
