//
//  ItemCollectionCell.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation
import UIKit

class ItemCollectionCell: UICollectionViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func setup() {
        self.name.text = "Pikachu"
        self.img.image = #imageLiteral(resourceName: "25.png")
    }
    
}
