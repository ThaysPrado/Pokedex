//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Thays Prado on 20/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation

protocol PokemonRepository {
    func listPokemon(offset: String,
                     onSuccess successCallback: ((_ response: [PokemonItem]) -> Void)?,
                     onFailure failureCallback: ((_ errorMessage: String) -> Void)?)
    
    func searchPokemon(name: String,
                       onSuccess successCallback: ((_ response: PokemonItemFound) -> Void)?,
                       onFailure failureCallback: ((_ errorMessage: String) -> Void)?)
    
    func fetchPokemon(name: String,
                      onSuccess successCallback: ((_ response: Pokemon) -> Void)?,
                      onFailure failureCallback: ((_ errorMessage: String) -> Void)?)
}
