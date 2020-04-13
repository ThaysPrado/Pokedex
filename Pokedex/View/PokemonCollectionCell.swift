//
//  ItemCollectionCell.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class PokemonCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!

    func setup(withViewModel viewModel: PokemonItem) -> (Void) {
        self.name.text = viewModel.name!
        self.img.kf.setImage(with: URL(string: viewModel.urlImg))
    }
    
}
