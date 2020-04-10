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
    
    var api: PokemonService
    var offset = 0
    
    var items: Variable< [PokemonItem]> = Variable([])
    
    init() {
        api = PokemonService()
        self.getPokemonList()
    }
    
    func getPokemonList() {
        self.api.listPokemon(parameters: ["offset": "\(offset)"],
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
    
}
