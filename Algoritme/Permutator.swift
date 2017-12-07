//
//  Permutator.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/19/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

class Permutator {
    
    class func permutation(_ str: String) -> Set<String> {
        var set = Set<String>()
        
        permutation(str, prefix: "", set: &set)
        
        return set
    }
    
    private class func permutation(_ str: String, prefix: String, set: inout Set<String>) {
        if str.characters.count == 0 {
            set.insert(prefix)
        }
        
        for i in str.characters.indices {
            
            let left    = str.substring(to: i)
            let right   = str.substring(from: str.index(after: i))
            
            let rem = left + right
            permutation(rem, prefix: prefix + String(str[i]), set: &set)
        }
    }
}
