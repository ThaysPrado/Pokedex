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
    @IBOutlet weak var container: UIView!
    
    func setup(withViewModel viewModel: PokemonItemPresentable) -> (Void) {
        self.name.text = viewModel.name?.uppercased() ?? ""
        self.img.kf.setImage(with: URL(string: viewModel.urlImg ?? ""))
        self.container.layer.cornerRadius = 5
    }
    
}
