//
//  Bars.swift
//  SquareMoves
//
//  Created by Lindsey pollock on 5/6/17.
//  Copyright © 2017 Lindsey pollock. All rights reserved.
//

import UIKit
import Firebase

struct Bars {
    
    var barName: String?
    var barHours: String?
    var barCapacity: Int
    var maxCapacity: Int
    
    init(barName: String?, barHours: String?, barCapacity: Int, maxCapacity: Int) {
        self.barName = barName
        self.barHours = barHours
        self.barCapacity = barCapacity
        self.maxCapacity = maxCapacity
    }
    
}
