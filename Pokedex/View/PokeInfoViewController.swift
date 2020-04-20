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
    @IBOutlet weak var informations: UILabel!
    @IBOutlet weak var abilities: UILabel!
    
    @IBOutlet weak var containerTypes: UIStackView!
    @IBOutlet weak var containerAbilities: UIStackView!
    
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
        self.imgDefault.kf.setImage(with: URL(string: pokemon.sprites[0] ))
        self.imgShiny.kf.setImage(with: URL(string: pokemon.sprites[1] ))
        
        self.informations.text = "Height: \(pokemon.height ?? "")  Width: \(pokemon.weight ?? "")"
        
        self.abilities.isHidden = false
        self.setTypes(types: pokemon.types)
        self.setAbilities(abilities: pokemon.abilities)
    }
    
    func setAbilities(abilities: [String]) {
        var axisY = 0
        for ability in abilities {
            self.createButtonAbility(axisY: axisY, title: ability)
            axisY += 45
        }
    }
    
    func createButtonAbility(axisY: Int, title: String = "None") {
        let containerBounds = self.containerAbilities.bounds
        let button = UIButton(frame: CGRect(x: 0, y: axisY, width: Int(containerBounds.width), height: 40))
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.init(named: "first")
        button.setTitle(title, for: .normal)
        
        self.containerAbilities.addSubview(button)
    }
    
    func setTypes(types: [String]) {
        var axisY = 0
        for type in types {
            self.createButtonType(axisY: axisY, type: type)
            axisY += 45
        }
    }
    
    func createButtonType(axisY: Int, type: String = "None") {
        let containerBounds = self.containerTypes.bounds
        let button = UIButton(frame: CGRect(x: 0, y: axisY, width: Int(containerBounds.width), height: 40))
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.init(named: type)
        button.setTitle(type, for: .normal)
        
        self.containerTypes.addSubview(button)
    }
    
    func setButton(btn: UIButton, type: String) {
        btn.layer.cornerRadius = 5
        btn.backgroundColor = UIColor.init(named: type)
        btn.titleLabel?.text = type.uppercased()
    }
    
}


