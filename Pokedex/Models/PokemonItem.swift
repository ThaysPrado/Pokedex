//
//  PokemonIte,.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation

class PokemonItem {
    
    var name: String?
    var index: String?
    
    init (json: [String: Any]) {
        if let name = json["name"] as? String { self.name = "\(name)" }
        if let url = json["url"] as? String {
            let arr = url.components(separatedBy: "pokemon/")
            self.index = arr[1].components(separatedBy: "/")[0]
        }
    }
    
    static func getModels(_ json: [[String: Any]]) -> [PokemonItem] {
        return json.map { PokemonItem(json: $0) }
    }

    
}

