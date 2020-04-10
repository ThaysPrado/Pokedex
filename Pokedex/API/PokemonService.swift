//
//  PokemonService.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Foundation
import SwiftyJSON

class PokemonService {

    public func listPokemon(parameters: [String: String],
                            onSuccess successCallback: ((_ response: [PokemonItem]) -> Void)?,
                            onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let url = apiBaseUrl + "?offset=" + (parameters["offset"] ?? "0") + "&limit=20"
        
        APICallManager.shared.createRequest(
            url, method: .get, headers: nil, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                var data = [PokemonItem]()
                if let pokemonList = responseObject["results"].arrayObject as? [[String: Any]] {
                    data = PokemonItem.getModels(pokemonList)
                }
                successCallback?(data)
            }, onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
            })
    }
    
}
