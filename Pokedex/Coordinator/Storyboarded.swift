//
//  Storyboarded.swift
//  Pokedex
//
//  Created by Webeleven on 16/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self : UIViewController {
    static func instantiate() -> Self {
        let fullname = NSStringFromClass(self)
        
        let className = fullname.components(separatedBy: ".")[1]
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

