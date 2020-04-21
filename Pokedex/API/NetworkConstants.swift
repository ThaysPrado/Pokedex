//
//  NetworkConstants.swift
//  Pokedex
//
//  Created by Thays Prado on 21/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Moya

struct NetworkConstants {
    struct URLs {
        static var baseURL: URL {
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
                fatalError("Error to convert string url to URL")
            }
            return url
        }
        static var imageURL: URL {
            guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/") else {
                fatalError("Error to convert string url to URL")
            }
            return url
        }
    }
    
    struct Headers {
        static var contentTypeApplicationJSON = ["Content-Type": "application/json"]
    }
}
