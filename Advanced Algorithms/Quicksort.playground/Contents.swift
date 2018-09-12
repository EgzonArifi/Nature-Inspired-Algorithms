//: Playground - noun: a place where people can play

import UIKit
import Foundation

var randomNumbers = [1,6,5,7,3,2,4]

//MARK: Last element pivot
func quickSort(array: inout [Int], start: Int, end: Int) {

    if start < end {
        let partitionIndex = partition(array: &array, start: start, end: end)
        quickSort(array: &array, start: start, end: partitionIndex - 1)
        quickSort(array: &array, start: partitionIndex + 1, end: end)
    }
}

func partition( array: inout [Int], start: Int, end: Int) -> Int {

    let pivot = array[end]
    var i = start
    print("Pivot \(pivot)")
    for j in start..<end {
        if array[j] < pivot {
            array.swapAt(j,i)
            i += 1
        }
    }

    print(array)
    array.swapAt(i, end)
    return i
}

//MARK: First element pivot
func firstQquickSort(array: inout [Int], start: Int, end: Int) {
    
    if start < end {
        let partitionIndex = firstElementPrtition(array: &array, start: start, end: end)
        firstQquickSort(array: &array, start: start, end: partitionIndex - 1)
        firstQquickSort(array: &array, start: partitionIndex + 1, end: end)
    }
}

func firstElementPrtition( array: inout [Int], start: Int, end: Int) -> Int {
    
    let pivot = array[start]
    var left = start + 1
    var right = start + 1
    print("Pivot \(pivot)")
   
    while right <= end {
        
        if array[right] <= pivot {
            array.swapAt(left, right)
            left += 1
        }
        right += 1
    }
    
    array.swapAt(start, left-1)
    print(array)
    return left - 1
}
//quickSort(array: &randomNumbers, start: 0, end: randomNumbers.count-1)
firstQquickSort(array: &randomNumbers, start: 0, end: randomNumbers.count-1)



