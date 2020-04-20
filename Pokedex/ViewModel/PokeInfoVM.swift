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
    var api: PokemonService
    
    private let _pokemon = PublishSubject<Pokemon>()
    
    var pokemon: Observable<Pokemon> {
        _pokemon.asObservable()
    }
    
    init(name: String) {
        api = PokemonService()
        self.getPokemonDetails(name: name)
    }
    
    func getPokemonDetails(name: String) {
        self.api.fetchPokemon(parameters: ["name": name.lowercased()],
        onSuccess: { (result) in
            let pokemon = result
            self._pokemon.onNext(pokemon)
        },
        onFailure: { (result) in
            print("404")
        })
    }
}
