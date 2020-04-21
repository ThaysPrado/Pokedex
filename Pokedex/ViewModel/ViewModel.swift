//
//  ViewModel.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    private let repository: PokemonRepository
    
    var offset = 0
    var searchName = ""
    
    var items: Variable< [PokemonItemPresentable]> = Variable([])
    
    init(repository: PokemonRepository = PokemonRemoteRepository()) {
        self.repository = repository
        self.getPokemonList()
    }
    
    func getPokemonList() {
        repository.listPokemon(offset: "\(offset)",
            onSuccess: { (result) in
               for item in result {
                   self.items.value.append(item)
               }
            },
            onFailure: { (result) in
               print(result)
            })
        self.offset += 20
    }
    
    func searchPokemonByName() {
        repository.searchPokemon(name: searchName.lowercased(),
            onSuccess: { (result) in
                self.items.value.removeAll()
                self.items.value.append(result)
            },
            onFailure: { (result) in
                print(result)
                self.clearSearch()
                self.getPokemonList()
            })
    }
    
    func clearSearch() {
        self.offset = 0
        self.items.value.removeAll()
    }
    
}
