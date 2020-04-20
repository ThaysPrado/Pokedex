//
//  PokemonItemFound.swift
//  Pokedex
//
//  Created by Thays Prado on 20/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation

class PokemonItemFound: PokemonItemPresentable {
    
    var urlImg: String?
    var name: String?
    var index: String?
    
    let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    
    init() {
        self.name = ""
        self.index = "0"
    }
    
    init(json: [String: Any]) {
        if let name = json["name"] as? String { self.name = "\(name)" }
        
        if let id = json["id"] {
            self.index = String(describing: id)
            self.urlImg = self.url + "\(self.index!).png"
        }
    }
    
    static func getModels(_ json: [String: Any]) -> PokemonItemFound {
        return PokemonItemFound(json: json)
    }

}
