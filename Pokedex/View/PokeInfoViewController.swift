//
//  PokeInfoViewController.swift
//  Pokedex
//
//  Created by Thays Prado on 16/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class PokeInfoViewController: UIViewController {
    
    internal var shinyImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    internal var defaultImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
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
    
    
    weak var coordinator: MainCoordinator?
    var viewModel: PokeInfoVM?
    var onBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    internal func setupUI() {
        view.addSubview(shinyImageView)
        view.addSubview(defaultImageView)
        view.addSubview(nameLabel)
    }
    
}


