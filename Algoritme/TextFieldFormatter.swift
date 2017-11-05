//
//  TextFieldFormatter.swift
//  Algoritme
//
//  Created by Egzon Arifi on 11/4/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

class OnlyIntegerValueFormatter: NumberFormatter {
    
    override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        
        // Ability to reset your field (otherwise you can't delete the content)
        // You can check if the field is empty later
        if partialString.isEmpty {
            return true
        }
        
        // Actual check
        return Int(partialString) != nil
    }
}
