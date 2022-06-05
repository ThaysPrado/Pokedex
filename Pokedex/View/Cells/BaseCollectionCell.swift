//
//  BaseCollectionCell.swift
//  Pokedex
//
//  Created by Thays Prado on 05/06/22.
//  Copyright © 2022 ThaysPrado. All rights reserved.
//

import UIKit

internal class BaseCollectionCell: UICollectionViewCell {
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    internal func setupUI() {}
    
    internal class var reuseIdentifier: String {
        return String(describing: self)
    }
    internal class var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    internal class var nibName: String {
        return String(describing: self)
    }
}
