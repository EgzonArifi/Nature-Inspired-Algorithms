//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Node {
    
    let value: Int
    var leftNode: Node?
    var rightNode: Node?
    
    init(value: Int, leftNode: Node?=nil, rightNode: Node?=nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BST {
    
    var rootNode: Node?
    
    //MARK: Public
    func addNode(_ value: Int) {
        let node = Node(value: value)
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    //MARK: Private
    private func insert(_ root: Node, _ node: Node) {
        if root.value > node.value {
            if let leftNode = root.leftNode {
                self.insert(leftNode, node)
            } else {
                root.leftNode = node
            }
        } else {
            if let rightNode = root.rightNode {
                self.insert(rightNode, node)
            } else {
                root.rightNode = node
            }
        }
    }
    
}


//             8
//           /   \
//          2     10
//        /  \   /  \
//       1    7 9   11

let numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7]
var root = BST()
for number in numberList {
    root.addNode(number)
}

