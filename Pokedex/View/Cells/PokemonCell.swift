//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

final class PokemonCell: BaseCollectionCell {
    
    internal var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    internal var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(color: .third)
        imageView.image = UIImage(named: UIImage.Images.pokeball.rawValue)
        return imageView
    }()
    
    internal var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.lato(with: .bold, forTextStyle: .subheadline)
        label.textColor = UIColor(color: .second)
        label.numberOfLines = 0
        return label
    }()
    

    internal override func setupUI() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
    
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.height.width.equalTo(80.0)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        contentView.backgroundColor = UIColor(color: .white)
    }
    
    internal override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        backgroundImageView.image = nil
        nameLabel.text = nil
    }
}
