//
//  Pokemon.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation

class Pokemon {
    
    var name: String?
    var weight: String?
    var height: String?
    var sprites: [String]?
    //var types: [String]?
    //var abilities: [Abilities]?
    
    init (json: [String: Any]) {
        if let name = json["name"] { self.name = "\(name)" }
        if let weight = json["weight"] as? Int { self.weight = "\(weight)" }
        if let height = json["height"] as? Int { self.height = "\(height)" }
        
        if let sprites = json["sprites"] as? [String: String] {
            let frontDefault = sprites["front_default"] ?? ""
            let frontShiny = sprites["front_shiny"] ?? ""
            
            self.sprites?.append(frontDefault)
            if frontShiny != "" { self.sprites?.append(frontShiny) }
        }
    }
    
    static func getModels(_ json: [[String: Any]]) -> [Pokemon] {
        return json.map { Pokemon(json: $0) }
    }

    
}