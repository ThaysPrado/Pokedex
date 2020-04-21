//
//  PokeInfoVM.swift
//  Pokedex
//
//  Created by Thays Prado on 16/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation
import RxSwift

class PokeInfoVM {
    
    private let repository: PokemonRepository
    private let _pokemon = PublishSubject<Pokemon>()
    
    var pokemon: Observable<Pokemon> {
        _pokemon.asObservable()
    }
    
    init(name: String, repository: PokemonRepository = PokemonRemoteRepository()) {
        self.repository = repository
        self.getPokemonDetails(name: name)
    }
    
    func getPokemonDetails(name: String) {
        repository.fetchPokemon(name: name.lowercased(),
        onSuccess: { (result) in
            let pokemon = result
            self._pokemon.onNext(pokemon)
        },
        onFailure: { (result) in
            print("404")
        })
    }
}
