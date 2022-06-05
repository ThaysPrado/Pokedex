//
//  UIImageExtension.swift
//  Pokedex
//
//  Created by Thays Prado on 04/06/22.
//  Copyright © 2022 ThaysPrado. All rights reserved.
//

import UIKit

extension UIImage {
    enum Images: String, CaseIterable {
        
        // BACKGROUND
        case patternAlternative = "pattern-alternative"
        case patternDefault = "pattern-default"
        case pokeball
        
        // TYPES
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
        
        // WEIGHT
        case weightHeavy = "weight-heavy"
        case weightLight = "weight-light"
        case weightNormal = "weight-normal"
        
        // HEIGHT
        case heightMedium = "height-medium"
        case heightShort = "height-short"
        case heightTall = "height-tall"
        
    }
}
