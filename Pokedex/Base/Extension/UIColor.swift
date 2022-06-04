//
//  UIColor.swift
//  Pokedex
//
//  Created by Thays Prado on 04/06/22.
//  Copyright © 2022 ThaysPrado. All rights reserved.
//

import UIKit

extension UIColor {
    
    enum Color: String, CaseIterable {
        // TYPE COLORS
        case bug
        case dark
        case dragon
        case eletric
        case fairy
        case fire
        case flying
        case ghost
        case grass
        case ground
        case ice
        case normal
        case poison
        case psychic
        case rock
        case shadow
        case steel
        case water
        
        // WEIGHT COLORS
        case weightHeavy = "weight-heavy"
        case weightLight = "weight-light"
        case weightNormal = "weight-normal"
        
        // HEIGHT COLORS
        case heightMedium = "height-medium"
        case heightShort = "height-short"
        case heightTall = "height-tall"
        
        // COMMON COLORS
        case first
        case second
        case black
        case white
        case gray
        case defaultInput = "default-input"
        case pressedInput = "pressed-input"
        
        
    }
    
    convenience init(color: Color) {
        self.init(named: color.rawValue)!
    }
}
