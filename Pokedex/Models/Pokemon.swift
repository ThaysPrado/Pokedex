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
    var sprites = [String]()
    var types = [String]()
    //var abilities: [Abilities]?
    
    init (json: [String: Any]) {
        if let name = json["name"] { self.name = "\(name)" }
        if let weight = json["weight"] as? Int { self.weight = "\(weight)" }
        if let height = json["height"] as? Int { self.height = "\(height)" }
        
        if let sprites = json["sprites"] as? [String: Any] {
            let frontDefault = sprites["front_default"] ?? ""
            let frontShiny = sprites["front_shiny"] ?? ""
            
            self.sprites.append(frontDefault as! String)
            self.sprites.append(frontShiny as! String)
        }
        
        if let typesArr = json["types"] as? [[String: Any]] {
            for item in typesArr {
                let type = item["type"] as? [String: Any] ?? [String: Any]()
                self.types.append(type["name"] as? String ?? "")
            }
        }
    }
    
    static func getModels(_ json: [[String: Any]]) -> [Pokemon] {
        return json.map { Pokemon(json: $0) }
    }

    
}
