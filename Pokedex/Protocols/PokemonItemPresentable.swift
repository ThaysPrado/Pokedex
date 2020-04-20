//
//  PokemonItemPresentable.swift
//  Pokedex
//
//  Created by Thays Prado on 20/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation

protocol PokemonItemPresentable {
    var name: String? { get set }
    var index: String? { get set }
    var urlImg: String? { get set }
}
