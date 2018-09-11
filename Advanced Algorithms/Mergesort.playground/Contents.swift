//: Playground - noun: a place where people can play

import UIKit
import Foundation

func mergeSort(array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
    let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
    
    let sortedArray = merge(leftPart: leftArray, rightPart: rightArray, array: array)
    return sortedArray
}


func merge(leftPart: [Int], rightPart: [Int], array: [Int]) -> [Int] {
    
    var i = 0
    var j = 0
    
    var orderedParts = [Int]()
    
    while i < leftPart.count && j < rightPart.count {
        
        if leftPart[i] < rightPart[j] {
            orderedParts.append(leftPart[i])
            i = i + 1
        } else {
            orderedParts.append(rightPart[j])
            j = j + 1
        }
    }
    
    while i < leftPart.count {
        orderedParts.append(leftPart[i])
        i = i + 1
    }
    
    while j < rightPart.count {
        orderedParts.append(rightPart[j])
        j = j + 1
    }
    
    return orderedParts
}

print(mergeSort(array: [2,4,1,6,8,5,3,7]))
