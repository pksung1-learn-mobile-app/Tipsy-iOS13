//
//  Tip.swift
//  Tipsy
//
//  Created by 박성원 on 2023/02/02.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Tip {
    
    var tip: Float = 0.0
    
    mutating func calculate (billTotal: Float, tipPercent: Float, split: Int) -> Float {
        self.tip = (billTotal + billTotal * tipPercent) / Float(split)
        return tip
    }
    
    
}
