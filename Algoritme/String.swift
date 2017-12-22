//
//  Double.swift
//  Algoritme
//
//  Created by Egzon Arifi on 12/21/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        return numberFormatter.number(from: self)?.doubleValue
    }
    
    
}
