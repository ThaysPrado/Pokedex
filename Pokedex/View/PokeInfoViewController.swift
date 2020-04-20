//
//  PokeInfoViewController.swift
//  Pokedex
//
//  Created by Thays Prado on 16/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Kingfisher

class PokeInfoViewController: UIViewController, Storyboarded {
    @IBOutlet weak var imgDefault: UIImageView!
    @IBOutlet weak var imgShiny: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    
    weak var coordinator: MainCoordinator?
    var viewModel: PokeInfoVM?
    var onBack: (() -> Void)?
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel?.pokemon.map { [weak self] in
            self?.setPokemonDetail(pokemon: $0)
        }.subscribe()
         .disposed(by: disposeBag)
    }
    
    private func setPokemonDetail(pokemon: Pokemon) {
        self.imgDefault.kf.indicatorType = .activity
        self.imgShiny.kf.indicatorType = .activity
        
        self.name.text = pokemon.name?.uppercased() ?? ""
        self.imgDefault.kf.setImage(with: URL(string: pokemon.sprites?[0] ?? ""))
        self.imgShiny.kf.setImage(with: URL(string: pokemon.sprites?[1] ?? ""))
        
        self.height.text = "Height: \(pokemon.height ?? "")"
        self.weight.text = "Width: \(pokemon.weight ?? "")"
    }
    
}

